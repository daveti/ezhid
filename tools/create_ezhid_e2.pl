#!/usr/bin/perl -w
#
# #############################################################################
#
# $Id: create_ezhid_e2.pl,v 1.3 2002/08/24 15:45:10 arniml Exp $
#
# Copyright (C) 2001, Arnim Laeuger
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version. See also the file COPYING which
#  came with this application.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
# #############################################################################
#
# Purpose:
# ========
#
# Takes an intel hex-file from STDIN and prints a hex-file suitable for boot-
# loading from a serial I2C EEPROM to STDOUT.
#

use strict;



# #############################################################################
# conv_hex($value)
#
# Converts the given integer parameter into a 2-character hex string.
#
# Input:
#   $value : decimal integer number
# Output:
#   returns conversion result in the range of 0x00 - 0xFF
# #############################################################################
sub conv_hex {
    my $value = shift;
    my $result;

    $value  %= 256;
    $result  = sprintf("%X", $value / 16);
    $result .= sprintf("%X", $value % 16);

    return($result);
}


# #############################################################################
# extract_record($ram, $addr, $record, $max_addr)
#
# Extracts a $record out of @$ram starting at $$addr with a maximum length
# of 1023.
# Uninitilized RAM at the beginning (-1) is skipped and if such RAM is found
# afterwards the record will end when more than 4 bytes are encountered.
#
# Input:
#   $ram      : array reference containing the device's RAM
#   $addr     : scalar reference, current index into @ram
#   $record   : return hash reference
#   $max_addr : last valid address in @ram
# Output:
#   $addr     : first unused index into @ram after extracting $record
#   $record   : extracted record structure with keys 'header' and 'payload'
#
# #############################################################################
sub extract_record {
    my ($ram, $addr, $record, $max_addr) = @_;
    my ($begin_rec, $end_rec, $num_empty, $num);
    my ($header, $payload, $i);

    # skip leading unused bytes
    while ($ram->[$$addr] eq '-1') {
        $$addr++;
    }

    # remember beginning of record
    $begin_rec = $$addr;

    $num_empty = 0;
    while (1) {

        if ($ram->[$$addr] eq '-1') {
            $num_empty++;
            # decide to suspend reading empty bytes when their number
            # is higher than the length of a header
            if ($num_empty > 4) {
                last;
            }
        } else {
            # reset counter
            $num_empty = 0;
        }

        last if ($$addr == $max_addr);
        last if ($$addr - $begin_rec + 1 == 1023);

        $$addr++;
    }

    # calculate end of record
    $end_rec = $$addr - $num_empty;
    $num     = $end_rec - $begin_rec + 1;
    # inc addr once more to let it point to the beginning
    # of the next record
    $$addr++;


    #
    # construct the header
    #print("num: $num, begin_rec: $begin_rec\n");
    $header = [];
    $header->[0] = conv_hex($num / 256);
    $header->[1] = conv_hex($num % 256);
    $header->[2] = conv_hex($begin_rec / 256);
    $header->[3] = conv_hex($begin_rec % 256);

    #
    # now that we have got the header, copy the payload
    $payload = [];
    for ($i = $begin_rec; $i <= $end_rec; $i++) {
        # convert uninitialzed bytes to 0xFF
        push(@{$payload}, $ram->[$i] ne '-1' ? $ram->[$i] : 'FF');
    }

    $record->{'header'}  = $header;
    $record->{'payload'} = $payload;
}



# #############################################################################
# dump_hex($eeprom)
#
# Takes the contents of @$eeprom and dumps it into an intel hex-file.
# It is assumed that the contents is continuous, i.e. that there are no gaps
# that have to be taken into account when dumping the hex-file.
#
# Input:
#   $eeprom : array reference to continuous memory
# Output:
#   prints to STDOUT
# #############################################################################
sub dump_hex {
    my $eeprom = shift;
    my $size;
    my ($pos, $begin, $len, $checksum);

    $pos  = 0;
    $size = scalar(@{$eeprom});
    while ($pos < $size) {
        $checksum = 0;
        $begin    = $pos;
        # each record is max 32 bytes in size
        $len      = $size - $pos  < 32 ? $size - $pos : 32;
        # initialize checksum
        $checksum = ($len + ($begin / 256) + ($begin % 256)) % 256;

        print(':'.conv_hex($len).conv_hex($begin / 256).conv_hex($begin % 256).
              '00');
        while ($len > 0) {
            print($eeprom->[$pos]);
            $checksum = ($checksum + hex($eeprom->[$pos])) % 256;
            $pos++;
            $len--;
        }
        $checksum = (~$checksum + 1) % 256;
        print(conv_hex($checksum)."\n");
    }

    # print the "End of File Record"
    print(":00000001FF\n");
}


sub print_record {
    my $record = shift;
    my $entry;

    print("Header:\n");
    foreach $entry (@{$record->{'header'}}) {
        print("$entry ");
    }
    print("\n");
    #
    print("Payload:\n");
    foreach $entry (@{$record->{'payload'}}) {
        print("$entry ");
    }
    print("\n");
}


# #############################################################################
# Main Program
# #############################################################################

my (@ram, @e2p, @eeprom);
my ($address, $num, $value, $checksum, $i, $j);
my $max_addr;
my ($record, $header, $payload);
my $entry;


# initialize RAM with 8k -1
for ($i = 0; $i < 2**12; $i++) {
    $ram[$i] = '-1';
}

#
# read in line after line and transfer it into @ram
$max_addr = 0;
while (<STDIN>) {
    if (m{^:(..)         # Record length     -> $1
            (..)         # Load Offset High  -> $2
            (..)         # Load Offset Low   -> $3
            00           # Record Type
            (.+)         # Data              -> $4
            (..)         # Checksum          -> $5
            \s*$}x) {
        $num      = hex($1);
        $address  = hex($2) * 256 + hex($3);
        $value    = $4;
        # precalculate checksum from header data
        $checksum = (hex($1) + hex($2) + hex($3) + hex($5)) % 256;
        for ($i = 0; $i < $num; $i++) {
            if ($value =~ /^(..)(.*)$/) {
                $ram[$address+$i] = $1;
                $checksum         = ($checksum + hex($1)) % 256;
                $value            = $2;
            }
        }

        die "Checksum error in line:\n  $_\n" if ($checksum != 0);

        # update maximum address
        $max_addr = $address + $i - 1 > $max_addr ? $address + $i - 1 : $max_addr;
    }
}


#
# create vendor header
$header = [];
$header->[0] = 'B2';
for ($i = 1; $i <= 6; $i++) {
    $header->[$i] = '00';
}
$record = {};
$record->{'header'} = $header;

push(@e2p, $record);

#
# examine @ram and create records of max 1023 bytes payload
$address = 0;
while ($address <= $max_addr) {
    $record = {};
    extract_record(\@ram, \$address, $record, $max_addr);
    push(@e2p, $record);

#    print_record($record);
}

#
# build the last record
$header = [];
push(@{$header}, ('80', '01', '7F', '92'));
$payload = [];
$payload->[0] = '00';
$record = {};
$record->{'header'}  = $header;
$record->{'payload'} = $payload;

push(@e2p, $record);


#
# copy the records to the continuous eeprom content
foreach $record (@e2p) {
    if (defined($record->{'header'})) {
        foreach $entry (@{$record->{'header'}}) {
            push(@eeprom, $entry);
        }
    }

    if (defined($record->{'payload'})) {
        foreach $entry (@{$record->{'payload'}}) {
            push(@eeprom, $entry);
        }
    }
}

#
# dump the hex-file to STDOUT
dump_hex(\@eeprom);

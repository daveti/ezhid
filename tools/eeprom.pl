#!/usr/bin/perl -w
#
# #############################################################################
#
# $Id: eeprom.pl,v 1.10 2003/12/30 15:49:00 arniml Exp $
#
# Copyright (C) 2002, 2003, Arnim Laeuger
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
# Talks to the vend_ax.hex firmware on a EZ-USB device to read and write
# the onboard I2C EEPROM.
# The vend_ax.hex file can be found in Cypress' Development Kit.
#
# eeprom.pl -d <usbfs name> -a <address> -l <length> -r -w -q [-D <data string>]
#              [-i <hex-file>] [-p <eeprom pagesize>]
#  -d : usbfs device name
#  -a : EEPROM address
#  -l : data length
#  -r : read EEPROM
#  -w : write EEPROM
#  -D : provides data in <data string> for write operation
#       bytes separated by spaces
#  -i : name of a file in intel hex-format for write operation
#  -p : pagesize of EEPROM
#  -q : query size of EEPROM
#
#  The options -r, -w and -q are mutually exclusive.
#  So are the options -D and -i. If none is specified, data is expected
#  from STDIN in ihex-format.
#  In the case that data is read from a file or STDIN, options -a and -l
#  are forbidden.
#  The pagesize can be chosen according to the databook of the EEPROM.
#  If not specified, the pagesize defaults to 1.
#     27xx00 :  1
#     27xx01 :  8
#     27xx16 : 16
#     27xx32 : 32
#     27xx64 : 32
#    27xx128 : 64
#    27xx256 : 64
#    27xx515 : 64
#


use strict;

use USB;
use Getopt::Std;


my $verbose = 0;
my %vendor_codes = ('RW_INTERNAL'     => 0xa0,
                    'RW_EEPROM'       => 0xa2,
                    'RW_MEMORY'       => 0xa3,
                    'GET_EEPROM_SIZE' => 0xa5);


# #############################################################################
# dec_hex_convert($number)
#
# Takes the given number and converts it into the decimal representation if it
# is in hexadecimal representation. Decimals are just propagated.
#
# Input:
#   $number : a decimal or hexadecimal number
# Return value:
#   the decimal equivalent of $number
#
# #############################################################################
sub dec_hex_convert {
    my $number = shift;

    return($number =~ /^0x/ ? hex($number) : $number);
}


# #############################################################################
# get_device($bus, $dev)
#
# Seaches given $bus for device $dev.
#
# Input:
#   $bus : bus number of requested device
#   $dev : device number of requested device
# Return value:
#   the usb_device pointer
#
# #############################################################################
sub get_device {
    my $bus = shift;
    my $dev = shift;
    my ($usb_bus, $usb_device);
    my ($bus_name, $dev_name);
    my %device_desc;
    my $matching_device = 0;


    $usb_bus = &USB::get_usb_busses();

  SCAN_BUS: {
      do {
          $bus_name = &USB::get_usb_busname($usb_bus);
          printf("Scanning bus name = %s\n", $bus_name) if ($verbose);

          print("Bus: $bus_name $bus\n") if ($verbose);
          if ($bus_name == $bus) {

              if (defined(&USB::get_usb_devices($usb_bus))) {
                  $usb_device = &USB::get_usb_devices($usb_bus);

                SCAN_DEVICE: {
                    do {
                        $dev_name = &USB::get_usb_devicename($usb_device);
                        print("Device: $dev_name $dev\n") if ($verbose);
                        if ($dev_name == $dev) {

                            %device_desc = %{ USB::get_usb_device_descriptor($usb_device) };
                            printf("Found device idVendor 0x%04x, idProduct 0x%04x, Class %d\n",
                                   $device_desc{'idVendor'}, $device_desc{'idProduct'},
                                   $device_desc{'bDeviceClass'}) if ($verbose);

                            $matching_device = $usb_device;
                            last SCAN_BUS;
                        }

                        if (defined(&USB::get_usb_next_device($usb_device))) {
                            $usb_device = &USB::get_usb_next_device($usb_device);
                        } else {
                            last SCAN_DEVICE;
                        }
                    } while (1 == 1);
                }
              }
          }


          if (defined(&USB::get_usb_next_bus($usb_bus))) {
              $usb_bus = &USB::get_usb_next_bus($usb_bus);
          } else {
              last SCAN_BUS;
          }
      } while (1 == 1);
  }

    return($matching_device);
}


# #############################################################################
# open_device_by_devfs_filename($devfs_filename)
#
# Opens the usbfs filehandle of the device specified in the parameter.
#
# Input:
#   $devfs_filename : filename of the usbfs device
# Return value:
#   returns the opened file handle
#
# #############################################################################
sub open_device_by_devfs_name {
    my $devfs_name = shift;
    my (@path_elems, $num, $bus, $device);
    my (@this_dev, $result);

    # test if the file name is really present and writeable
    if (-w $devfs_name) {

        @path_elems = split(/\//, $devfs_name);
        $num = scalar(@path_elems);

        $device = $path_elems[$num - 1];
        $bus    = $path_elems[$num - 2];

        print("$bus $device\n") if ($verbose);

        @this_dev = get_device($bus, $device);

        $result = &USB::usb_open($this_dev[0]);
    } else {
        print(STDERR "Can't open $devfs_name for writing!\n");
        undef($result);
    }

    return($result);
}


# #############################################################################
# usb_read_eeprom($device, $address, $length, $data)
#
# Read data at given address from EEPROM.
#
# Input:
#   $device   : file handle for the usbfs device
#   $address  : address of data in EEPROM
#   $length   : length of data
# Output:
#   $data     : this array ref will be filled with the received bytes
# Return value:
#   number of read bytes, -1 on error
#
# #############################################################################
sub usb_read_eeprom {
    my $device  = shift;
    my $address = shift;
    my $length  = shift;
    my $data    = shift;
    my ($rd, $result);
    local *ZERO_FILE;

    # 0 = autodetect; 1 = 8 bit address; 2 = 16 bit address
    my $i2c_address_size  = 0;
    # hardwired address part, not relevant during autodetect
    my $i2c_wired_address = 1;
    # pagesize of EEPROM (not relevant for read operation)
    my $i2c_pagesize = 1;

    open(ZERO_FILE, "</dev/zero");
    $result = read(ZERO_FILE, $rd, $length);
    close(ZERO_FILE);

    if ($result == $length) {

        $result = &USB::usb_control_msg($device,    0xc0, $vendor_codes{'RW_EEPROM'},
                                        $address,
                                        ($i2c_wired_address << 4) | $i2c_address_size |
                                        ($i2c_pagesize << 8),
                                        $rd, $length, 1000);
        if ($result > 0) {
            @{$data} = unpack("C$result", $rd);

            if ($result != $length) {
                print(STDERR "Could not read all requested data from the EEPROM.\n");
            }
        } else {
            print(STDERR "Error while reading the EEPROM.\n");
        }
    } else {
        print(STDERR "Could not initialize raw data scalar.\n");
        $result = -1;
    }

    return($result);
}


# #############################################################################
# usb_write_eeprom($device, $address, $length, $data)
#
# Write given data at specified address to EEPROM.
#
# Input:
#   $device   : file handle for the usbfs device
#   $address  : address of data in EEPROM
#   $length   : length of data
#   $pagesize : pagesize of the EEPROM
#   $data     : reference of array containing the data (bytewise)
# Return value:
#   number of written bytes, -1 on error
#
# #############################################################################
sub usb_write_eeprom {
    my ($device,
        $address,
        $length,
        $pagesize,
        $data      ) = @_;
    my ($rd, $result);

    # 0 = autodetect; 1 = 8 bit address; 2 = 16 bit address
    my $i2c_address_size  = 0;
    # hardwired address part, not relevant during autodetect
    my $i2c_wired_address = 1;
    #
    # Some pagesizes taken from their databooks:
    #
    #  27xx00 :  1
    #  27xx01 :  8
    #  27xx16 : 16
    #  27xx32 : 32
    #  27xx64 : 32
    # 27xx128 : 64
    # 27xx256 : 64
    # 27xx515 : 64

    $rd = pack("C$length", @{$data});

    $result = &USB::usb_control_msg($device,    0x40, $vendor_codes{'RW_EEPROM'},
                                    $address, 
                                    ($i2c_wired_address << 4) | $i2c_address_size |
                                    ($pagesize << 8),
                                    $rd, $length, 1000);
    if ($result > 0) {
        if ($result != $length) {
            print(STDERR "Could not read all requested data from the EEPROM.\n");
        }
    } else {
        print(STDERR "Error while writing the EEPROM.\n");
    }

    return($result);
}


# #############################################################################
# usb_query_eeprom($device)
#
# Query the EEPROM size.
#
# Input:
#   $defive    : file handle for the usbfs device
# Return vallue:
#   1 if all ok, -1 on error
#
# ############################################################################
sub usb_query_eeprom {
    my $device = shift;
    my ($rd, $result);
    my @data;

    $rd = ' ';
    $result = &USB::usb_control_msg($device, 0xc0, $vendor_codes{'GET_EEPROM_SIZE'},
                                    0, 0, $rd, 1, 1000);
    if ($result == 1) {
        @data = unpack("C1", $rd);
        if ($data[0] == 0) {
            print("EEPROM type is 8 bit (or not existing).\n");
        } elsif ($data[0] == 1) {
            print("EEPROM type is 16 bit.\n");
        } else {
            print("Unknown EEPROM. Query answered: $data[0].\n");
        }
    } else {
        print(STDERR "Error while querying the EEPROM.\n");
        $result = -1;
    }

    return($result);
}

# #############################################################################
# read_eeprom($device, $address, $length)
#
# Wrapper for usb_read_eeprom(). Read requests are split into smaller
# packages. This allows debugging the firmware if it seems to have problems
# with larger requests.
#
# Input:
#   $device   : file handle for the usbfs device
#   $address  : address of data in EEPROM
#   $length   : length of data
# Return value:
#   number of read bytes, -1 on error
#
# #############################################################################
sub read_eeprom {
    my ($device,
        $address,
        $length   ) = @_;
    my $max_len = 128;
    my (@data, $elem);
    my ($result, $received, $requested);

    $received = 0;
    while ($received < $length) {
        $requested = $length - $received >= $max_len ? $max_len : $length - $received;
        $result = usb_read_eeprom($device, $address + $received, $requested, \@data);
        print("Read $result Bytes\n");

        if ($result == $requested) {
            $received += $requested;
            foreach $elem (@data) {
                printf("0x%02x ", $elem);
            }
            print("\n");
        } else {
            $result = -1;
            last;
        }
    }

    return($result > 0 ? $received : $result);
}


# #############################################################################
# write_eeprom($device, $address, $length, $data)
#
# Wrapper for usb_write_eeprom(). Data is split into packets of 128 bytes.
#
# Input:
#   $device   : file handle for the usbfs device
#   $address  : address of data in EEPROM
#   $length   : length of data
#   $pagesize : pagesize of the EEPROM
#   $data     : reference of array containing the data (bytewise)
# Return value:
#   number of written bytes, -1 on error
#
# #############################################################################
sub write_eeprom {
    my ($device,
        $address,
        $length,
        $pagesize,
        $data      ) = @_;
    my $max_len = 128;
    my ($result, $transmitted, $requested);
    my (@partial_data, $i);

    $transmitted = 0;
    while ($transmitted < $length) {
        $requested = $length - $transmitted >= $max_len ? $max_len : $length - $transmitted;

        # copy scheduled data in a loop
        # could be reduced to one single statement (using [..]) but the dec/hex
        # conversion is necessary
        for ($i = $transmitted; $i < $transmitted+$requested; $i++) {
            push(@partial_data, dec_hex_convert($data->[$i]));
        }
        $result = usb_write_eeprom($device, $address + $transmitted, $requested, 
                                   $pagesize, \@partial_data);

        if ($result == $requested) {
            $transmitted += $requested;
        } else {
            $result = -1;
            last;
        }
    }

    return($result > 0 ? $transmitted : $result);
}


# #############################################################################
# write_eeprom_from_file($device, FILE)
#
# Reads in all records in FILE and writes them to the EEPROM via
# write_eeprom().
#
# Input:
#   $device   : file handle for the usbfs device
#   $pagesize : pagesize of the EEPROM
#   FILE      : descriptor of the opened hex-file
# Return value:
#   1 on success, 0 on error
#
# #############################################################################
sub write_eeprom_from_file {
    my ($device,
        $pagesize,
        $file_contents) = @_;
    my ($len, $address, $value, $checksum);
    my (@records, $record, $data);
    my ($i, $result, $line);

    $result = 1;
    foreach $line (@{$file_contents}) {
        if ($line =~ m{^:(..)         # Record length     -> $1
                         (..)         # Load Offset High  -> $2
                         (..)         # Load Offset Low   -> $3
                         00           # Record Type
                         (.+)         # Data              -> $4
                         (..)         # Checksum          -> $5
                         \s*$}x) {
            $len      = hex($1);
            $address  = hex($2) * 256 + hex($3);
            $value    = $4;
            # precalculate checksum from header data
            $checksum = (hex($1) + hex($2) + hex($3) + hex($5)) % 256;

            $record = {};
            $record->{'len'}  = $len;
            $record->{'addr'} = $address;
            $record->{'data'} = [];
            push(@records, $record);
            $data = $record->{'data'};

            for ($i = 0; $i < $len; $i++) {
                if ($value =~ /^(..)(.*)$/) {
                    push(@{$data}, hex('0x'.$1));
                    $checksum = ($checksum + hex($1)) % 256;
                    $value    = $2;
                }
            }

            if ($checksum != 0) {
                print(STDERR "Checksum error in line:\n  $line\n");
                $result = -1;
                last;
            }
        }
    }

    if ($result > 0) {
        # transfer the records to the EZ-USB device
        foreach $record (@records) {
            $len     = $record->{'len'};
            $address = $record->{'addr'};
            $data    = $record->{'data'};

            $result = write_eeprom($device, $address, $len, $pagesize, $data);
            if ($result != $len) {
                print(STDERR "Could not write $len bytes to EEPROM.\n");
                $result = -1;
                last;
            } else {
                print("Writing $len bytes @ $address\n");
            }
        }
    }

    return($result > 0 ? 1 : -1);
}


sub print_usage {
    print <<EOU;
Usage: eeprom.pl -d <usbfs name> -a <address> -l <length> -r -w -q [-D <data string>]
                 [-i <hex-file>] [-p <eeprom pagesize>]
  -d : usbfs device name
  -a : EEPROM address
  -l : data length
  -r : read EEPROM
  -w : write EEPROM
  -D : provides data in <data string> for write operation
       bytes separated by spaces
  -i : name of a file in intel hex-format for write operation
  -p : pagesize of EEPROM
  -q : query size of EEPROM

  The options -r, -w and -q are mutually exclusive.
  So are the options -D and -i. If none is specified, data is expected
  from STDIN in ihex-format.
  In the case that data is read from a file or STDIN, options -a and -l
  are forbidden.
  The pagesize can be chosen according to the databook of the EEPROM.
  If not specified, the pagesize defaults to 1.
     27xx00 :  1
     27xx01 :  8
     27xx16 : 16
     27xx32 : 32
     27xx64 : 32
    27xx128 : 64
    27xx256 : 64
    27xx515 : 64

EOU
}


# #############################################################################
# Main Program
# #############################################################################

my %options;
my ($device_name, $dev_handle);
my (@data, $elem);
my ($address, $length);
my ($read, $write, $query);
my $pagesize = 1;
my $ihex_filename = "";
my $read_ihex_file = 0;
my $result;
my @file_contents;


if (getopts('ha:d:l:D:rwi:qp:', \%options)) {

    if (exists($options{'h'})) {
        print_usage();
        exit(0);
    }
    if (exists($options{'d'})) {
        $device_name = $options{'d'};
    } else {
        print_usage();
        exit(1);
    }

    if (exists($options{'a'})) {
        $address = dec_hex_convert($options{'a'});
    }
    if (exists($options{'l'})) {
        $length = dec_hex_convert($options{'l'});
    }

    if (exists($options{'p'})) {
        $pagesize = $options{'p'};
    }

    $read = $write = $query = 0;
    if (exists($options{'r'}) && ($options{'r'} == 1)) {
        $read  = 1;
    }
    if (exists($options{'w'}) && ($options{'w'} == 1)) {
        $write = 1;
    }
    if (exists($options{'q'}) && ($options{'q'} == 1)) {
        $query = 1;
    }
    if ($read + $write + $query > 1) {
        print_usage();
        exit(1);
    }

    if (exists($options{'D'})) {
        @data = split(/ /, $options{'D'});

        if (!(exists($options{'a'}) && exists($options{'l'}))) {
            print(STDERR "You must specify -a and -l with -D.\n");
            print_usage();
            exit(1);
        }
    }
    if (exists($options{'i'})) {
        $ihex_filename = $options{'i'};
        # also open the file
        -r $ihex_filename or die "Can't open $ihex_filename.\n";
        @file_contents = `cat $ihex_filename`;
        $read_ihex_file = 1;
    }
    if ($write && !(exists($options{'D'}) || exists($options{'i'}))) {
        # retrieve ihex information from STDIN
        @file_contents = <STDIN>;
        $read_ihex_file = 1;
    }

    if ($read_ihex_file && (exists($options{'l'}) || exists($options{'a'}))) {
        print(STDERR "-l or -a must not be specified when reading an ihex file.\n");
        print_usage();

        exit(1);
    }

    die "Can't initialize USB subsystem\n" if (defined(&USB::usb_init()));
    die "Can't find busses\n" if (&USB::usb_find_busses() != 0);
    die "Can't find devices\n" if (&USB::usb_find_devices() != 0);


    $dev_handle = open_device_by_devfs_name($device_name);
    if (defined($dev_handle)) {

        if ($read) {
            $result = read_eeprom($dev_handle, $address, $length);
        }

        if ($write) {
            if (exists($options{'D'})) {
                $result = write_eeprom($dev_handle, $address, $length, $pagesize, \@data);
            } else {
#                print("@file_contents");
                $result = write_eeprom_from_file($dev_handle, $pagesize, \@file_contents);
            }
        }

        if ($query) {
            $result = usb_query_eeprom($dev_handle);
        }

        &USB::usb_close($dev_handle);
    } else {
        print(STDERR "Can't open USB device handle\n");
    }

} else {
    print_usage();
}

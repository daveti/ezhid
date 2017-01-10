#!/usr/bin/perl -w
#
# #############################################################################
#
# $Id: hub.pl,v 1.6 2003/06/01 09:31:42 arniml Exp $
#
# Copyright (C) 2002, Arnim Laeuger
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
# Display HUB status information including ports.
# Power-cycle individual ports.
#
# hub.pl [-v] [-l] [-h] [-c <port num>]
#   -v : be verbose
#   -l : list HUB and port status
#   -c : power-cycle port <port_num>
#   -d : the HUB's usbfs device name
#


use strict;

use USB;
use Getopt::Std;


# Global variables
my $verbose = 0;


# #############################################################################
# get_hubs($all, $bus, $dev)
#
# Scans all USB busses and devices for a matching $bus/$dev or returns all
# found HUBs.
#
# Input:
#   $all : 1 = retrieve all HUBs, 0 = retrieve only HUB selected by $bus, $dev
#   $bus : bus number of requested HUB
#   $dev : device number of requested HUB
# Return value:
#   returns an array of usb_device pointer(s)
#
# #############################################################################
sub get_hubs {
    my $all = shift;
    my $bus = shift;
    my $dev = shift;
    my ($usb_bus, $usb_device);
    my ($bus_name, $dev_name);
    my %device_desc;
    # @hubs is an array of usb_device references
    my @hubs = ();


    $usb_bus = &USB::get_usb_busses();

  SCAN_BUS: {
      do {
          $bus_name = &USB::get_usb_busname($usb_bus);
          printf("Scanning bus name = %s\n", $bus_name) if ($verbose);

          print("Bus: $bus_name $bus\n") if ($verbose);
          if (($all == 1) || ($bus_name == $bus)) {

              if (defined(&USB::get_usb_devices($usb_bus))) {
                  $usb_device = &USB::get_usb_devices($usb_bus);

                SCAN_DEVICE: {
                    do {
                        $dev_name = &USB::get_usb_devicename($usb_device);
                        print("Device: $dev_name $dev\n") if ($verbose);
                        if (($all == 1) || ($dev_name == $dev)) {

                            %device_desc = %{ USB::get_usb_device_descriptor($usb_device) };
                            printf("Found device idVendor 0x%04x, idProduct 0x%04x, Class %d\n",
                                   $device_desc{'idVendor'}, $device_desc{'idProduct'},
                                   $device_desc{'bDeviceClass'}) if ($verbose);

                            if ($device_desc{'bDeviceClass'} == 0x09) {
                                push(@hubs, $usb_device);
                            }
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

    print("A total of ".scalar(@hubs)." hubs was found.\n") if ($verbose);

    return(@hubs);
}


# #############################################################################
# get_hub_descriptor($device, $hub_desc)
#
# Retrieves the HUB descriptor.
#
# Input:
#   $device   : file handle for the HUB usbfs device
#   $hub_desc : hash reference hash to contain the HUB descriptor
# Output:
#   fills in $hub_desc with the retrieved HUB descriptor
# Return value:
#   1 if ok, 0 upon error
#
# #############################################################################
sub get_hub_descriptor {
    my $device   = shift;
    my $hub_desc = shift;
    my @raw_data;
    my ($result, $rd);

    $rd = "         ";
    $result = &USB::usb_control_msg($device, 0xa0, 0x06, 0x2900, 0x0000, $rd, 9, 1000);
    if ($result == 9) {
        # usage of 'S' here bears the hope that the USB driver has stored the
        # 16 bit value in native endianess because Perl will unpack it in
        # native endianess
        @raw_data = unpack("C3SC4", $rd);

        $hub_desc->{'bDescLength'}         = $raw_data[0];
        $hub_desc->{'bDescriptorType'}     = $raw_data[1];
        $hub_desc->{'bNbrPorts'}           = $raw_data[2];
        $hub_desc->{'wHubCharacteristics'} = $raw_data[3];
        $hub_desc->{'bPwrOn2PwrGood'}      = $raw_data[4];
        $hub_desc->{'bHubContrCurrent'}    = $raw_data[5];
        $hub_desc->{'DeviceRemovable'}     = $raw_data[6];
        $hub_desc->{'PortPwrCtrlMask'}     = $raw_data[7];

        $result = 1;
    } else {
        $result = 0;
    }

    return($result);
}


# #############################################################################
# get_hub_status($device, $hub_status)
#
# Retrieves the HUB status information.
#
# Input:
#   $device     : file handle for the HUB usbfs device
#   $hub_status : hash reference hash to contain the HUB status
# Output:
#   fills in $hub_status with the retrieved status information
# Return value:
#   1 if ok, 0 upon error
#
# #############################################################################
sub get_hub_status {
    my $device     = shift;
    my $hub_status = shift;
    my @raw_data;
    my ($result, $rd, $t);

    $rd = "    ";
    $result = &USB::usb_control_msg($device, 0xa0, 0x00, 0x0000, 0x0000, $rd, 4, 10000);
    if ($result == 4) {
        @raw_data = unpack("SS", $rd);

        $hub_status->{'wHubStatus'} = $raw_data[0];
        $hub_status->{'wHubChange'} = $raw_data[1];

        # examine wHubChange
        $t = $hub_status->{'wHubChange'};
        $hub_status->{'C_HUB_LOCAL_POWER'}  = $t & 0x0001 ? 1 : 0;
        $hub_status->{'C_HUB_OVER_CURRENT'} = $t & 0x0002 ? 1 : 0;

        $result = 1;
    } else {
        $result = 0;
    }

    return($result);
}


# #############################################################################
# get_port_status($device, $port_num, $port_status)
#
# Retrieves the status information about a given port.
#
# Input:
#   $device      : file handle for the HUB usbfs device
#   $port_num    : port number at specified HUB
#   $port_status : hash reference hash to contain the port status
# Output:
#   fills in $port_status with the retrieved status information
# Return value:
#   1 if ok, 0 upon error
#
# #############################################################################
sub get_port_status {
    my $device      = shift;
    my $port_num    = shift;
    my $port_status = shift;
    my @raw_data;
    my ($result, $rd, $t);

    $rd = "    ";
    $result = &USB::usb_control_msg($device, 0xa3, 0x00, 0x0000, $port_num, $rd, 4, 10000);
    if ($result == 4) {
        @raw_data = unpack ('SS', $rd);

        $port_status->{'wPortStatus'} = $raw_data[0];
        $port_status->{'wPortChange'} = $raw_data[1];

        # examine wPortStatus
        $t = $port_status->{'wPortStatus'};
        $port_status->{'PORT_CONNECTION'}     = $t & 0x0001 ? 1 : 0;
        $port_status->{'PORT_ENABLE'}         = $t & 0x0002 ? 1 : 0;
        $port_status->{'PORT_SUSPEND'}        = $t & 0x0004 ? 1 : 0;
        $port_status->{'PORT_OVER_CURRENT'}   = $t & 0x0008 ? 1 : 0;
        $port_status->{'PORT_RESET'}          = $t & 0x0010 ? 1 : 0;
        $port_status->{'PORT_POWER'}          = $t & 0x0100 ? 1 : 0;
        $port_status->{'PORT_LOW_SPEED'}      = $t & 0x0200 ? 1 : 0;

        # examine wPortChange
        $t = $port_status->{'wPortChange'};
        $port_status->{'C_PORT_CONNECTION'}   = $t & 0x0001 ? 1 : 0;
        $port_status->{'C_PORT_ENALE'}        = $t & 0x0002 ? 1 : 0;
        $port_status->{'C_PORT_SUSPEND'}      = $t & 0x0004 ? 1 : 0;
        $port_status->{'C_PORT_OVER_CURRENT'} = $t & 0x0008 ? 1 : 0;
        $port_status->{'C_PORT_RESET'}        = $t & 0x0010 ? 1 : 0;

        $result = 1;
    } else {
        $result = 0;
    }

    return($result);
}


# #############################################################################
# open_hub_by_devfs_filename($devfs_filename)
#
# Opens the usbfs filehandle of the HUB device specified in the parameter.
#
# Input:
#   $devfs_filename : filename of the usbfs device
# Return value:
#   returns the opened file handle
#
# #############################################################################
sub open_hub_by_devfs_name {
    my $devfs_name = shift;
    my (@path_elems, $num, $bus, $device);
    my (@this_hub, $result);

    # test if the file name is really present and writeable
    if (-w $devfs_name) {

        @path_elems = split(/\//, $devfs_name);
        $num = scalar(@path_elems);

        $device = $path_elems[$num - 1];
        $bus    = $path_elems[$num - 2];

        print("$bus $device\n") if ($verbose);

        @this_hub = get_hubs(0, $bus, $device);

        $result = &USB::usb_open($this_hub[0]);
    } else {
        print("Can't open $devfs_name for writing!\n");
        undef($result);
    }

    return($result);
}

sub print_kind {
    my $hash = shift;
    my $kind = shift;
    my $const_len = 17;
    my $template = "               ";
    my $alined_kind;

    $alined_kind = $kind.substr($template, 0, $const_len - length($kind));
    print("  $alined_kind : $hash->{$kind}\n");
}


# #############################################################################
# list_hub_information($device_name)
#
# Lists available information about the given HUB device:
#   - HUB status
#   - HUB descriptor
#   - port status
#
# Input:
#   $device_name : filename of the usbfs device
#
# #############################################################################
sub list_hub_information {
    my $device_name = shift;
    my $dev_handle;
    my (%hub_desc, %hub_status, %port_status);
    my ($port_num, $kind);

    $dev_handle = open_hub_by_devfs_name($device_name);
    if (defined($dev_handle)) {
        if (get_hub_status($dev_handle, \%hub_status) == 1) {
            print("HUB Status:\n");
            if ($hub_status{'wHubStatus'} & 0x0001) {
                print(" Local power supply lost\n");
            } else {
                print(" Local power supply good\n");
            }
            if ($hub_status{'wHubStatus'} & 0x0002) {
                print(" A hub over-current condition exists\n");
            } else {
                print(" No over-current condition currently exists\n");
            }
        } else {
            print("Can't get HUB status\n");
        }

        if (get_hub_descriptor($dev_handle, \%hub_desc) == 1) {
            print("Number of Ports: $hub_desc{'bNbrPorts'}\n");

            if (($hub_desc{'wHubCharacteristics'} & 0x0003) == 0) {
                print(" Ganged port power switching\n");
            } else {
                if (($hub_desc{'wHubCharacteristics'} & 0x0003) == 1) {
                    print(" Individual port power switching\n");
                }
            }

            # Cycle through ports
            foreach $port_num (1..$hub_desc{'bNbrPorts'}) {
                if (get_port_status($dev_handle, $port_num, \%port_status) == 1) {
                    print(" Port $port_num Status:\n");
                    $kind = 'PORT_CONNECTION';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_ENABLE';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_SUSPEND';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_OVER_CURRENT';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_RESET';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_POWER';
                    print_kind(\%port_status, $kind);
                    $kind = 'PORT_LOW_SPEED';
                    print_kind(\%port_status, $kind);

                } else {
                    print("Can't get port status\n");
                }
            }
        } else {
            print("Can't get HUB descriptor\n");
        }

        &USB::usb_close($dev_handle);
    }
}


# #############################################################################
# power_cycle_port($device_name, $port_num)
#
# Power-cycles a port at the given HUB. I.e. power is switched off and on.
#
# Input:
#   $device_name : filename of the usbfs device
#   $port_num    : port number at specified HUB
#
# #############################################################################
sub power_cycle_port {
    my $device_name = shift;
    my $port_num    = shift;
    my $dev_handle;
    my ($rd, $result);

    $dev_handle = open_hub_by_devfs_name($device_name);
    if (defined($dev_handle)) {

        $rd = " ";
        # Clear Port Feature
        $result = &USB::usb_control_msg($dev_handle, 0x23, 0x01, 0x0008, $port_num, $rd, 0, 10000);
        if ($result == 0) {
            print("Clear Port Power ok\n");

            sleep(1);

            $rd = " ";
            # Set Port Feature
            $result = &USB::usb_control_msg($dev_handle, 0x23, 0x03, 0x0008, $port_num, $rd, 0, 10000);
            if ($result == 0) {
                print("Set Port Power ok\n");
            } else {
                print("Error from Set Port Power\n");
            }

        } else {
            print("Error from Clear Port Power\n");
        }


        &USB::usb_close($dev_handle);
    } else {
        print("Can't open HUB device handle in power_cycle_port()\n");
    }
}


sub print_usage {
    print <<EOU;
Usage: $0 [-v] [-l] [-h] [-c <port num>] -d <usbfs name>
  -v : be verbose
  -l : list HUB and port status
  -c : power-cycle port <port_num>
  -d : the HUB's usbfs device name

EOU
#'
}


my @hubs;
my %options;
my $hub_device_name = '';
my $exit_code = 0;


if (getopts('lvc:hd:', \%options)) {

    if (exists($options{'v'}) && ($options{'v'} == 1)) {
        $verbose = 1;
    } else {
        $verbose = 0;
    }

    if (exists($options{'h'}) && ($options{'h'} == 1)) {
        print_usage();
        exit(0);
    }

    if (exists($options{'d'})) {
        $hub_device_name = $options{'d'};
    } else {
        print_usage();
        exit(1);
    }

    die "Can't initialize USB subsystem\n" if (defined(&USB::usb_init()));
    die "Can't find busses\n" if (&USB::usb_find_busses() < 0);
    die "Can't find devices\n" if (&USB::usb_find_devices() < 0);

    # Example to retrieve information for all HUBs
    #@hubs = get_hubs(1, '000', '000');

    if (exists($options{'l'}) && ($options{'l'} == 1)) {
        list_hub_information($hub_device_name);
    }

    if (exists($options{'c'})) {
        power_cycle_port($hub_device_name, $options{'c'});
    }

} else {
    print_usage();
    $exit_code = 1;
}

exit($exit_code);

use input::init;
use strict;


my $ini = init->new();
$ini->ReadFILEUSERINI();
$ini->PrintFILEUSERINI();
$ini->ReadFILESERVERINI();
$ini->PrintFILESERVERINI();
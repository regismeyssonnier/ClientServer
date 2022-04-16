use strict;
use IO::Socket;
use input::init;

my $ini = init->new();
$ini->ReadFILESERVERINI();
$ini->PrintFILESERVERINI();

my $sock = IO::Socket->new(
	Domain    => AF_INET,
	Listen    => 1,
	LocalAddr => $ini->{LocalAddr},
	LocalPort => $ini->{LocalPort},
	Proto     => 'tcp',
	Type      => SOCK_STREAM 
)or die "Server is unavailable(OFF).\nRetry later\n";

print "SERVER OK.\n";


my $accsock = $sock->accept or die "accept: $!";

print $accsock "Connection accepted - OK.\n";

			
# récupère la réponse
my $data =  <$accsock>;
chomp $data;
print $data ." - [request received OK].\n";


#:raw pas de crlf \x0D\x0A(\r\n) mais \x0A
open (my $fhw, '<:raw', $data) or die "Impossible d'ouvrir le fichier";
while(my $ligne = <$fhw>)
{
	print $accsock $ligne;

}

close $fhw;
	

print  "End connection - [File transmitted - OK].\n";

# ferme la connexion
close $sock or die "close: $!";
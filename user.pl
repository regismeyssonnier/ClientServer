use strict;
use IO::Socket;
use input::init;

my $ini = init->new();
$ini->ReadFILEUSERINI();
$ini->PrintFILEUSERINI();

my $addr = $ini->{'PeerAddr'};
my $port = $ini->{'PeerPort'};

#Connect to the server
my $sock = IO::Socket->new(
	Domain   => AF_INET,
	PeerAddr => $addr,
	PeerPort => $port,
	Proto    => 'tcp',
	Type      => SOCK_STREAM
) or die "Server is unavailable ...\nRetry later ...\n\n";


print "Connnecting to the server - OK.\n";

# envoie la requête
print $sock $ini->{File} ."\n";

# récupère la réponse
my $data = <$sock>;
print $data;

select( ( select($sock), $| = 1 )[0] );
#$sock->autoflush();

# récupère la réponse
my $data = do { local $/; <$sock> };
	
chomp $ini->{File};
my $file = "received".$ini->{File};
print "Receiving " .$ini->{File} ." renamed " .$file . "\n";

open (my $fh, '>:raw', $file) or die "Impossible d'ouvrir le fichier";
print $fh $data; 
close $fh;

$sock->autoflush();
	
		

print "End of connection - OK.\n";

# ferme la connexion
close $sock or die "close: $!";



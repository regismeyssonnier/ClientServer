package init;
use strict;

sub new
{
	my $class = shift;
	my $self = {};
	bless $self, $class;
	$self->{"PeerAddr"} = '127.0.0.1';
	$self->{"PeerPort"} = '800';
	$self->{"LocalAddr"} = '127.0.0.1';
	$self->{"LocalPort"} = '800';
	$self->{"File"} = "";
	return $self;

}


sub ReadFILEUSERINI
{
	my $self = shift;
	my $i = 0;
	my $data = "";
	open (my $fhw, '<', 'user.ini') or die "Impossible d'ouvrir le fichier";
	while(my $ligne = <$fhw>)
	{
		#print $ligne;
		#print $fhw $ligne;
		if($i == 0)
		{
			$ligne =~ s/PeerAddr://;
			$self->{PeerAddr} = $ligne;
			
		}
		elsif($i == 1)
		{
			$ligne =~ s/PeerPort://;
			$self->{PeerPort} = $ligne;
			
		}
		elsif($i == 2)
		{
			$ligne =~ s/File://;
			$self->{File} = $ligne;
			
		}
		
		$i++;

	}
	
	close $fhw or die "Impossible d'ouvrir user.ini: $!";


}


sub ReadFILESERVERINI
{
	my $self = shift;
	my $i = 0;
	my $data = "";
	open (my $fhws, '<', 'server.ini') or die "Impossible d'ouvrir le fichier";
	while(my $ligne = <$fhws>)
	{
		#print $ligne;
		#print $fhws $ligne;
		if($i == 0)
		{
			$ligne =~ s/LocalAddr://;
			$self->{LocalAddr} = $ligne;
			
		}
		elsif($i == 1)
		{
			$ligne =~ s/LocalPort://;
			$self->{LocalPort} = $ligne;
			
		}
				
		$i++;

	}
	
	close $fhws or die "Impossible d'ouvrir server.ini: $!";


}


sub PrintFILEUSERINI
{
	my $self = shift;
	print "\nPeerAddr:" .$self->{PeerAddr};
	print "PeerPort:" .$self->{PeerPort};
	print "File:" .$self->{File} ."\n";


}


sub PrintFILESERVERINI
{
	my $self = shift;
	print "\nLocalAddr:" .$self->{LocalAddr};
	print "LocalPort:" .$self->{LocalPort}."\n";
	

}



1;
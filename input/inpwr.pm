package inpwr;
use strict;


sub new
{
	my $class = shift;
	my $self = {};
	bless $self, $class;
	$self->{max} = 1;
	return $self;

}

sub what
{
	my $class = shift;
	return "Input a number, display, write and read in a file like you want !!!";
}

sub why
{
	my $class = shift;
	my($t) = @_;
	my $i = 0;
	my $s = "";
	for($i = 0;$i < $t;$i++)
	{
		$s .= "Hi Ho Ha ";
				
	}
	$s .= "Yeah !!!\n";
	return "\n" .$s ."Input a number, display, write and read in a file like you want !!!";
}

sub pressure
{
	my $class = shift;
	my($t) = @_;
	return "\n\n$t stop bougnoule, immigre, negro, anti-blancs, pro noir, grognement anti personnel!!!!!!!!";
}

sub InputMax
{
	my $self = shift;
	my $n = <>;

	if($n > 0){
		$self->{max} = $n;
		}
	
}

sub DisplayMax
{
	my $self = shift;
	my $i = 0;
	
	while($i < $self->{max})
	{
		print "hey\n";
		$i++;
		
	}
	
}


sub WriteFile
{
	my $self = shift;
	my $i=0;
	open (my $fh, '>', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while($i < $self->{max})
	{
		print $fh "Hello, World !\n"; 
		print $fh "Hello, World !\n"; 
		print $fh "Hello, World !\n"; 
		$i++;
	}

	close $fh;

	$i=0;
	open (my $fha, '>>', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while($i < $self->{max})
	{
		print $fha "append Hello, World !\n"; 
		print $fha "append Hello, World !\n"; 
		print $fha "append Hello, World !\n"; 
		$i++;
	}

	close $fha;

}


sub ReadFile
{
	my $self = shift;
	print "file loading ...\n\n";


	open (my $fhw, '<', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while(my $ligne = <$fhw>)
	{
		print $ligne;

	}

	close $fhw;
	
}

1;



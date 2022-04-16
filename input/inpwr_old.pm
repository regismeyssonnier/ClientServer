package inpwr;
use strict;


sub new
{
	my($class) = @_;
	$class = ref($class) || $class;
	my $this = {};
	bless($this, $class);
	$this->{max} = 1;
	return $this;

}

sub what
{
	my($class) = @_;
	return "Input a number, display, write and read in a file like you want !!!";
}

sub why
{
	my($class, $t) = @_;
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
	my($class, $t) = @_;
	return "\n\nstop bougnoule, immigre, negro, anti-blancs, pro noir, grognement anti personnel!!!!!!!!";
}

sub InputMax
{
	my($this) = @_;
	my $n = <>;

	if($n > 0){
		$this->{max} = $n;
		}
	
}

sub DisplayMax
{
	my($this) = @_;
	my $i = 0;
	
	while($i < $this->{max})
	{
		print "hey\n";
		$i++;
		
	}
	
}


sub WriteFile
{
	my($this) = @_;
	my $i=0;
	open (my $fh, '>', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while($i < $this->{max})
	{
		print $fh "Hello, World !\n"; 
		print $fh "Hello, World !\n"; 
		print $fh "Hello, World !\n"; 
		$i++;
	}

	close $fh;

	$i=0;
	open (my $fha, '>>', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while($i < $this->{max})
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
	my($this) = @_;
	print "file loading ...\n\n";


	open (my $fhw, '<', 'fichier_test.txt') or die "Impossible d'ouvrir le fichier";
	while(my $ligne = <$fhw>)
	{
		print $ligne;

	}

	close $fhw;
	
}

1;



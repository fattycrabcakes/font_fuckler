package FontFuckler;

use strict;
use Modern::Perl;
use Moo;
use Font::TTF;

our $VERSION = "0.1.0";
our $ABSTRACT = "Fucklin` with Fonts, Y'all";

has ttf=>(is=>'rw',default=>sub { Font::TTF->new();});
has source=>(is=>'rw');

sub open {
	my ($class,$file) = @_;

	my $self = $class->new();
	$self->source(Font::TTF::Font->open($file));
	return $self;
}

sub 

1;

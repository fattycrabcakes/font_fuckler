package FontFuckler::Font;

use strict;
use Modern::Perl;
use Moo;
use Font::TTF::Font;
use FontFuckler::Font::Names;
use Data::Dumper;

has filename=>(is=>"rw");
has ttf=>(is=>'rw');
has maxuid=>(is=>'rw');

sub open {
	my ($class,$filename) = @_;

	say "$filename";

	my $self = $class->new();
	$self->ttf(Font::TTF::Font->open($filename));
	return $self;
}

sub glyph_for {
	my ($self,$char) = @_;

	my $gid = $self->table("post","STRINGS",$char);
	if (!$gid) {
		return undef;
	}
	my $uid = FontFuckler::Font::Names->id_from_name($char);
	my $map = $self->table("cmap","Tables",0,"val");
	say Dumper($map);
	return undef if (!$map);
	my $index = $map->{$uid};
	return $self->table("loca","glyphs",$index)->read_dat();
}

sub string {
	my ($self,$key,$value) = @_;

	my $details = $self->name_table_map->{$key};
	return undef if (!$details);

	my $t = $self->ttf->table("name","strings");

	if (defined $value) {
		my $val;
		foreach my $node (@{$details->{nodes}}) {
			$t->[$node]->[1]->[0]->{0} = $value;
			$t->[$node]->[3]->[1]->{1033} = $value;
		}
	} else {
		return $t->{$details->{nodes}->[0]}->[1]->[1]->[0]->{0};
	}
}

sub name_table_map {
	return {
    	name=>{minor=>0,major=>1033,nodes=>[qw(1 4 6 16)]},
    	style=>{minor=>0,major=>1033,nodes=>[qw(2 17)]},
    	version=>{minor=>0,major=>1033,nodes=>[5]},
  	};
}

sub table {
	my ($self,$table,@fields) = @_;

	my $t = $self->ttf->{$table};
	$t->read if ($t);
	while (@fields) {
		my $k = shift(@fields);
		if (defined $k) {
			if (ref($t) eq "ARRAY") { $t = $t->[$k]; } else { $t = $t->{$k}; }
		}
	}
	return $t;
}
	




1;
__DATA__


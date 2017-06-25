use 5.008005;
use ExtUtils::MakeMaker 7.12; # for XSMULTI option


WriteMakefile(
  NAME           => 'FontFuckler',
  VERSION_FROM   => 'lib/FontFuckler.pm',
  PREREQ_PM      => {
	'ExtUtils::MakeMaker' => '7.12',
    'Image::Magick'=>0,
    'Data::Dumper'=>0,
    'Getopt::Long'=>0,
    'List::Util'=> 1.47,
	'Moose'=>0,
	'Moose::Role'=>0,
	'MooseX::MethodAttributes'=>0,
	'Time::HiRes'=>0,
	'FindBin'=>0,
	'File::Copy'=>0,
	'Test::More'=>0,
	'Term::ReadLine'=>0,
	'JSON::XS'=>0,
	'File::Type'=>0,
  },
  AUTHOR         => 'Fatty Crabcakes',
  OPTIMIZE       => '-O3',
  LICENSE        => 'oOtherLicense',
  #"EXE_FILES"	=>["scripts/goatify"],
  dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);

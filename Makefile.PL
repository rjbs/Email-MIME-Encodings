use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME		=> 'Email::MIME::Encodings',
  VERSION_FROM	=> 'lib/Email/MIME/Encodings.pm', # finds $VERSION
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM     => {
    'MIME::Base64'      => '3.05',
    'MIME::QuotedPrint' => '3.03',
  },
);

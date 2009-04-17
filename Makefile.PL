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
  (eval { ExtUtils::MakeMaker->VERSION(6.46) }
    ? (META_MERGE => {
        resources => {
          repository => 'http://github.com/rjbs/email-mime-encodings'
        }
      })
    : ()
  ),
);

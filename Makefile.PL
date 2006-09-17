use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Email::MIME::Encodings',
    'VERSION_FROM'	=> 'lib/Email/MIME/Encodings.pm', # finds $VERSION
               PREREQ_PM     => {
                                 'MIME::Base64' => '3.05',
                                 'MIME::QuotedPrint' => '3.03',
                                },
);

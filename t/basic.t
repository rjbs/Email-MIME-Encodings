use Test::More tests => 12;
use_ok("Email::MIME::Encodings");

my $x = "This is a test\nof various MIME=stuff.";
for (qw(binary 7bit 8bit)) {
    is(Email::MIME::Encodings::encode($_, $x), $x, "enc $_");
    is(Email::MIME::Encodings::decode($_, $x), $x, "dec $_");
}

$y= "This is a test\nof various MIME=3Dstuff.=\n";
is(Email::MIME::Encodings::encode(quotedprint => $x), $y, "enc qp");
is(Email::MIME::Encodings::decode(quotedprint => $y), $x, "dec qp");

$z="VGhpcyBpcyBhIHRlc3QKb2YgdmFyaW91cyBNSU1FPXN0dWZmLg==\n";
is(Email::MIME::Encodings::encode(base64 => $x), $z, "enc 64");
is(Email::MIME::Encodings::decode(base64 => $z), $x, "dec 64");

eval { 
    Email::MIME::Encodings::encode(foo => $x);
};

like ($@, qr/how to encode foo/, "Error handling");

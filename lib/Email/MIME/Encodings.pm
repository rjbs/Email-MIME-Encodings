package Email::MIME::Encodings;
use strict;
no strict 'refs';
use warnings;

$Email::MIME::Encodings::VERSION = "1.310";

use MIME::Base64;
use MIME::QuotedPrint;

sub identity { $_[0] }

for (qw(7bit 8bit binary)) {
    *{"encode_$_"} = *{"decode_$_"} = \&identity;
}

sub codec {
    my ($which, $how, $what) = @_;
    $how = lc $how;
    $how = "qp" if $how eq "quotedprint" or $how eq "quoted-printable";
    my $sub = $which."_".$how;
    if (not defined &$sub) {
        require Carp;
        Carp::croak("Don't know how to $which $how");
    }
    $sub->($what);
}

sub decode { return codec("decode", @_) }
sub encode { return codec("encode", @_) }

1;

=head1 NAME

Email::MIME::Encodings - A unified interface to MIME encoding and decoding

=head1 SYNOPSIS

  use Email::MIME::Encodings;
  my $encoded = Email::MIME::Encodings::encode(base64 => $body);
  my $decoded = Email::MIME::Encodings::decode(base64 => $encoded);

=head1 DESCRIPTION

This module simply wraps C<MIME::Base64> and C<MIME::QuotedPrint>
so that you can throw the contents of a C<Content-Transfer-Encoding>
header at some text and have the right thing happen.

=head1 AUTHOR

Simon Cozens, C<simon@cpan.org>

=head1 SUPPORT

Beep... beep... this is a recorded announcement:

I've released this software because I find it useful, and I hope you
might too. But I am a being of finite time and I'd like to spend more of
it writing cool modules like this and less of it answering email, so
please excuse me if the support isn't as great as you'd like.

Nevertheless, there is a general discussion list for users of all my
modules, to be found at
http://lists.netthink.co.uk/listinfo/module-mayhem

If you have a problem with this module, someone there will probably have
it too.

=head1 SEE ALSO

C<MIME::Base64>, C<MIME::QuotedPrint>, C<Email::MIME>.

=head1 COPYRIGHT AND LICENSE

Copyright 2004, Casey West F<<casey@geeknest.com>>.

Copyright 2003 by Simon Cozens

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

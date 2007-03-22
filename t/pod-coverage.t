#!perl -T

use Test::More;
eval "use Test::Pod::Coverage 1.08";
plan skip_all => "Test::Pod::Coverage 1.08 required for testing POD coverage"
  if $@;

my @private;
for (qw(7bit 8bit binary)) {
  push @private, "encode_$_", "decode_$_";
}

all_pod_coverage_ok({
  coverage_class => 'Pod::Coverage::CountParents',
  private        => [ qw(codec identity), @private ],
  trustme        => [ qw(encode decode) ],
});

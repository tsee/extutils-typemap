package ExtUtils::Typemap::OutputMap;
use 5.006001;
use strict;
use warnings;
our $VERSION = '0.05';
use ExtUtils::Typemap;
use ExtUtils::Typemaps::OutputMap;
our @ISA = qw(ExtUtils::Typemaps::OutputMap);

=head1 NAME

ExtUtils::Typemap::OutputMap - Entry in the OUTPUT section of a typemap

=head1 SYNOPSIS

  use ExtUtils::Typemap;
  ...
  my $output = $typemap->get_output_map('T_NV');
  my $code = $output->code();
  $output->code("...");

=head1 DESCRIPTION

Refer to L<ExtUtils::Typemap> for details.

=head1 METHODS

=cut

=head2 new

Requires C<xstype> and C<code> parameters.

=cut

=head2 code

Returns or sets the OUTPUT mapping code for this entry.

=cut

=head2 xstype

Returns the name of the XS type of the OUTPUT map.

=cut

=head1 SEE ALSO

L<ExtUtils::Typemap>

=head1 AUTHOR

Steffen Mueller C<<smueller@cpan.org>>

=head1 COPYRIGHT & LICENSE

Copyright 2009, 2010, 2011 Steffen Mueller

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut

1;


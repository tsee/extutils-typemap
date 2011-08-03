package ExtUtils::Typemap::Type;
use 5.006001;
use strict;
use warnings;
our $VERSION = '0.05';
use Carp qw(croak);
use ExtUtils::Typemap;
use ExtUtils::Typemaps::Type;
our @ISA = qw(ExtUtils::Typemaps::Type);

=head1 NAME

ExtUtils::Typemap::Type - Entry in the TYPEMAP section of a typemap

=head1 SYNOPSIS

  use ExtUtils::Typemap;
  ...
  my $type = $typemap->get_type_map('char*');
  my $input = $typemap->get_input_map($type->xstype);

=head1 DESCRIPTION

Refer to L<ExtUtils::Typemap> for details.
Object associates C<ctype> with C<xstype>, which is the index
into the in- and output mapping tables.

=head1 METHODS

=cut

=head2 new

Requires C<xstype> and C<ctype> parameters.

Optionally takes C<prototype> parameter.

=cut

=head2 proto

Returns or sets the prototype.

=cut

=head2 xstype

Returns the name of the XS type that this C type is associated to.

=cut

=head2 ctype

Returns the name of the C type as it was set on construction.

=cut

=head2 tidy_ctype

Returns the canonicalized name of the C type.

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


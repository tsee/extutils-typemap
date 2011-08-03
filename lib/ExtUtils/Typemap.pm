package ExtUtils::Typemap;
use 5.006001;
use strict;
use warnings;
our $VERSION = '0.05';
use ExtUtils::Typemaps;
our @ISA = qw(ExtUtils::Typemaps);

=head1 NAME

ExtUtils::Typemap - Read/Write/Modify Perl/XS typemap files

=head1 SYNOPSIS

  # read/create file
  my $typemap = ExtUtils::Typemap->new(file => 'typemap');
  # alternatively create an in-memory typemap
  # $typemap = ExtUtils::Typemap->new();
  # alternatively create an in-memory typemap by parsing a string
  # $typemap = ExtUtils::Typemap->new(string => $sometypemap);
  
  # add a mapping
  $typemap->add_typemap(ctype => 'NV', xstype => 'T_NV');
  $typemap->add_inputmap (xstype => 'T_NV', code => '$var = ($type)SvNV($arg);');
  $typemap->add_outputmap(xstype => 'T_NV', code => 'sv_setnv($arg, (NV)$var);');
  $typemap->add_string(string => $typemapstring); # will be parsed and merged
  
  # remove a mapping (same for remove_typemap and remove_outputmap...)
  $typemap->remove_inputmap(xstype => 'SomeType');
  
  # save a typemap to a file
  $typemap->write(file => 'anotherfile.map');
  
  # merge the other typemap into this one
  $typemap->merge(typemap => $another_typemap);

=head1 DESCRIPTION

This module can read, modify, create and write Perl XS typemap files. If you don't know
what a typemap is, please confer the L<perlxstut> and L<perlxs> manuals.

The module is not entirely round-trip safe: For example it currently simply strips all comments.
The order of entries in the maps is, however, preserved.

We check for duplicate entries in the typemap, but do not check for missing
C<TYPEMAP> entries for C<INPUTMAP> or C<OUTPUTMAP> entries since these might be hidden
in a different typemap.

=head1 METHODS

=cut

=head2 new

Returns a new typemap object. Takes an optional C<file> parameter.
If set, the given file will be read. If the file doesn't exist, an empty typemap
is returned.

Alternatively, if the C<string> parameter is given, the supplied
string will be parsed instead of a file.

=cut

=head2 file

Get/set the file that the typemap is written to when the
C<write> method is called.

=cut

=head2 add_typemap

Add a C<TYPEMAP> entry to the typemap.

Required named arguments: The C<ctype> (e.g. C<ctype =E<gt> 'double'>)
and the C<xstype> (e.g. C<xstype =E<gt> 'T_NV'>).

Optional named arguments: C<replace =E<gt> 1> forces removal/replacement of
existing C<TYPEMAP> entries of the same C<ctype>.

As an alternative to the named parameters usage, you may pass in
an C<ExtUtils::Typemap::Type> object, a copy of which will be
added to the typemap.

=cut

=head2 add_inputmap

Add an C<INPUT> entry to the typemap.

Required named arguments:
The C<xstype> (e.g. C<xstype =E<gt> 'T_NV'>)
and the C<code> to associate with it for input.

Optional named arguments: C<replace =E<gt> 1> forces removal/replacement of
existing C<INPUT> entries of the same C<xstype>.

You may pass in a single C<ExtUtils::Typemap::InputMap> object instead,
a copy of which will be added to the typemap.

=cut

=head2 add_outputmap

Add an C<OUTPUT> entry to the typemap.
Works exactly the same as C<add_inputmap>.

=cut

=head2 add_string

Parses a string as a typemap and merge it into the typemap object.

Required named argument: C<string> to specify the string to parse.

=cut

=head2 remove_typemap

Removes a C<TYPEMAP> entry from the typemap.

Required named argument: C<ctype> to specify the entry to remove from the typemap.

Alternatively, you may pass a single C<ExtUtils::Typemap::Type> object.

=cut

=head2 remove_inputmap

Removes an C<INPUT> entry from the typemap.

Required named argument: C<xstype> to specify the entry to remove from the typemap.

Alternatively, you may pass a single C<ExtUtils::Typemap::InputMap> object.

=cut

=head2 remove_inputmap

Removes an C<OUTPUT> entry from the typemap.

Required named argument: C<xstype> to specify the entry to remove from the typemap.

Alternatively, you may pass a single C<ExtUtils::Typemap::OutputMap> object.

=cut

=head2 get_typemap

Fetches an entry of the TYPEMAP section of the typemap.

Mandatory named arguments: The C<ctype> of the entry.

Returns the C<ExtUtils::Typemap::Type>
object for the entry if found.

=cut

=head2 get_inputmap

Fetches an entry of the INPUT section of the
typemap.

Mandatory named arguments: The C<xstype> of the
entry.

Returns the C<ExtUtils::Typemap::InputMap>
object for the entry if found.

=cut

=head2 get_outputmap

Fetches an entry of the OUTPUT section of the
typemap.

Mandatory named arguments: The C<xstype> of the
entry.

Returns the C<ExtUtils::Typemap::InputMap>
object for the entry if found.

=cut

=head2 write

Write the typemap to a file. Optionally takes a C<file> argument. If given, the
typemap will be written to the specified file. If not, the typemap is written
to the currently stored file name (see C<-E<gt>file> above, this defaults to the file
it was read from if any).

=cut

=head2 as_string

Generates and returns the string form of the typemap.

=cut

=head2 merge

Merges a given typemap into the object. Note that a failed merge
operation leaves the object in an inconsistent state so clone if necessary.

Mandatory named argument: C<typemap =E<gt> $another_typemap>

Optional argument: C<replace =E<gt> 1> to force replacement
of existing typemap entries without warning.

=cut

=head1 CAVEATS

Not as well tested as I'd like it to be.

Inherits some evil code from C<ExtUtils::ParseXS>.

Adding more typemaps incurs an O(n) validation penalty
that could be optimized with a hash.

=head1 SEE ALSO

The parser is heavily inspired from the one in L<ExtUtils::ParseXS>.

For details on typemaps: L<perlxstut>, L<perlxs>.

=head1 AUTHOR

Steffen Mueller C<<smueller@cpan.org>>

=head1 COPYRIGHT & LICENSE

Copyright 2009, 2010, 2011 Steffen Mueller

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut

1;


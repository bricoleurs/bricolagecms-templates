<%doc>

=head1 NAME

contributor_list.mc - Outputs a list of contributors

=head1 SYNOPSIS

  <& /util/text/contributor_list.mc,
     asset   => $story,
     sep     => ', ',
     final   => ', and ',
     format  => '%f% l',
     default => 'Macworld Staff'
  &>

=head1 DESCRIPTION

Outputs a formatted list of the contributors to a story. The supported
parameters are all optional, and are as follows:

=over 4

=item C<$asset>

The asset from which to get the list of contributors. Useful for getting the
list of contributors for a related story or media asset. Defaults to the
global C<$story> object.

=item C<$sep>

The separator to put between each name in the list, except betwee the
second-to-last and last names in the list. The default is ", ".

=item C<$final>

The separator put between the second-to-last and last names in the list. The
default is ", and ".

=item C<$format>

The C<strfname> formatting string used to format each person's name. Defaults
to the value of the "Name Format" preference. See Bric::Biz::Person for
complete documentation of the C<strfname> formats.

=item C<$sort>

The property on which to sort the list of contributors. By default, the list
of contributors will be output in the order they're returned by
C<< $story->get_contributors >>, but if you need them to be output in some
other order, use this argument. The possible options for this argument are:

=over 4

=item full_name

=item lname

=item fname

=item mname

=item prefix

=item suffix

=item type

=back

=item C<$default>

The default value to display if there are no contributors associated with the
story. Defaults to an empty string ("").

=item C<$type>

The type of contributors to include in the list. If a document has more than
one type of contributor (such as writers and illustrators) and you want to
list only one type (writers), pass in that type name to this parameter.

=back

=head1 AUTHOR

David Wheeler <david@kineticode.com>

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2003 David Wheeler & Kineticode, Inc and by Mac Publishing, LLC.

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation, version 2.1 of the License.

This library is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License along
with this library (see the the license.txt file); if not, write to the Free
Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
USA.

=cut

</%doc>
<%once>;
my $full_name_get = sub { $_[0]->get_name($_[1]) };
</%once>
<%args>
$sep     => ', '
$final   => ', and '
$format  => undef
$sort    => undef
$asset   => $story
$default => ''
$type    => undef
</%args>
<%init>;
# Get the list of contributors.
my @contribs = defined $type
  ? grep { $_->get_grp->get_name eq $type} $asset->get_contributors
  : $asset->get_contributors;
unless (@contribs) {
    # If there are no contributors, just output the default and return.
    $m->print($default);
    return 1;
}
if ($#contribs == 0) {
    # There's just one contributor. Format and return.
    $m->print($contribs[0]->get_name($format));
    return 1;
}
if ($sort) {
    # We need to resort them.
    my $get = $sort eq 'full_name' ? sub { $_[0]->get_name($format) } :
      Bric::Util::Grp::Parts::Member::Contrib->my_meths->{$sort}{get_meth};
    @contribs = sort { lc $get->($a) cmp lc $get->($b) } @contribs;
}
# Grab the last name in the list.
my $last = pop @contribs;
# Output the list.
$m->print(join($sep, map { $_->get_name($format) } @contribs),
          $final, $last->get_name($format));
return 1;
</%init>

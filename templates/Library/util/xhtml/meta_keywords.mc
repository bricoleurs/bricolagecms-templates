<%doc>

=head1 NAME

meta_keywords.mc - Outputs a keywords "meta" tag.

=head1 SYNOPSIS

  <& /util/xhtml/meta_keywords.mc, which => $which &>

=head1 DESCRIPTION

Outputs an XHTML-compliant "meta" tag for keywords. The C<which> parameter
tells F<keyword_list.mc> which keywords to return. The possible values are the
same as for the F<keyword_list.mc> template.

=head2 REQUIREMENTS

You must have the F<keyword_list.mc> template installed.

=head1 AUTHOR

David Wheeler <david@kineticode.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Kineticode, Inc and by Mac Publishing, LLC.

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
<%init>;
$m->print('<meta name="keywords" content="',
          encode_entities( join (', ', map { $_->get_name }
                    $m->comp('/util/keyword_list.mc', %ARGS))),
          '" />');
return;
</%init>

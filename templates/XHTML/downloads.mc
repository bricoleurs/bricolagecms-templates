<%perl>;
foreach my $e ( $element->get_elements(qw(paragraph download_branch header
                                          subheader))) {
    my $kn = $e->get_key_name;
    if ($kn eq 'paragraph') {
        $m->print('          <p>', $e->get_data, "</p>\n");
    } elsif ($kn eq 'header') {
        $m->print('          <h2>', $e->get_data, "</h2>\n");
    } elsif ($kn eq 'subhead') {
        $m->print('          <h3>', $e->get_data, "</h3>\n");
    } else {
        $burner->display_element($e);
    }
}
</%perl>\
<%doc>

=pod

=head1 Name

/downloads.mc - XHTML output for downloads documents on the Bricolage CMS site

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright & License

Copyright (c) 2004-2009 David Wheeler & Kineticode. All rights reserved.

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

</%doc>\

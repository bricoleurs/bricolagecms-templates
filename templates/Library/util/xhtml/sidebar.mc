          <div id="sidebar">
<% "<& /ui/ssi/search.cmp &>\\" %>
<%perl>;
if (my @download_shortcuts = $element->get_elements('download_shortcut')) {
    $burner->display_element($_) for @download_shortcuts;
}
if (my $links = $element->get_container('related_links')) {
    $burner->display_element($links);
} else {
    $m->print("<& /archive/mason.cmp &>\\\n");
}
</%perl>
        </div>
<%doc>

=pod

=head1 Name

/util/xhtml/sidbar.mc - Outputs the code to load the sidebar in documents on The Bricolage CMS site

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

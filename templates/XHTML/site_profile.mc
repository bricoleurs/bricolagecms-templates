% my $text = $element->get_data('name');
% my $url = $element->get_data('site_url');
            <dt><a href="<% encode_entities($url) %>" title="Visit <% encode_entities($text) %>"><% $text %></a></dt>
% if (my $description = $element->get_data('description')) {
            <dd><% $description %></dd>
% }
<%doc>

=pod

=head1 Name

/site_profile.mc - XHTML output for site profiles on the Bricolage CMS site

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

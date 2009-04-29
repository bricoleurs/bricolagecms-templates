% my $list_name = $element->get_data('list_name');
% my $list_url  = $element->get_data('list_url');
<dl class="mailinglists">
  <dt><a href="<% $list_url %>" title="Subscribe to <% encode_entities($list_name) %>"><% $list_name %></a></dt>
% if (my $archive_url = $element->get_data('archive_url')) {
  <dd class="archivelink">[ <a href="<% $archive_url %>" title="Browse the <% encode_entities($list_name) %> archives">Archives</a> ]</dd>
% }
% if ($element->get_data('description')) {
  <dd>
%     for my $e ($element->get_elements('description')) {
            <p><% $e->get_data %><p>
%     }
  </dd>
% }
</dl>
<%doc>

=pod

=head1 Name

/mailing_list.mc - XHTML output for mailing list information on the Bricolage CMS site

=head1 Author

Marshall Roch <mashall@exclupen.com>

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

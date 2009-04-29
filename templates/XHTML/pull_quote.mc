          <div class="pullquote float<% $element->get_data('position') %>">
            <blockquote>
% for my $p ($element->get_elements('paragraph')) {
              <p><% $p->get_data %></p>
% }
            </blockquote>
% if (my $attr = $element->get_data('attribution')) {
            <p><cite><% $attr %></cite></p>
% }
          </div>
<%doc>

=pod

=head1 Name

/pull_quote.mc - XHTML output for pull quotes on the Bricolage CMS site

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

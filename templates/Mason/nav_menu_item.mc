% my $class = $burner->notes('first_nav') ? '' : ' class="first"';
      <li<% $class %>><a href="<% $uri %>" title="<% $tip %>"><% $element->get_data('title') %></a>
        <ul>
% $burner->display_element($_)
%   for $element->get_elements(qw(external_nav_link nav_link nav_menu_item));
        </ul>
      </li>
% $burner->notes(first_nav => 1);
<%init>;
my $uri = '#';
my $tip = '';
if (my $link = $element->get_related_story) {
    $uri = $burner->best_uri($link)->as_string;
    $tip = $element->get_data('tooltip') || '';
}
</%init>\
<%doc>

=pod

=head1 Name

/nav_menu_item.mc Outputs a menu for use in the nave menu on bricolae.cc

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

% my $cat = $burner->get_cat->get_uri;
% $cat = undef if $cat eq '/archive';
% my @articles = $m->comp('/util/archive_list.mc', category => $cat);
          <h1>Recent News</h1>
          <dl>
% for my $art (@articles) {
%     my $elem = $art->get_element;
            <dt><a href="<% $burner->best_uri($art)->as_string . '/' %>" title=""><% $art->get_title %></a></dt>
            <dd>
              <p><% $elem->get_data('teaser') || $elem->get_data('paragraph') %></p>
              <p class="date"><% $art->get_cover_date('%Y.%m.%d') %></p>
            </dd>
% }
          </dl>
          <p><a href="/archive/" title="Site Archives">Older stories...</a></p>
<%doc>

=pod

=head1 Name

/archive.mc - Outputs a Mason component for a an archive document on bricolage.cc

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright & License

Copyright (c) 2004 David Wheeler & Kineticode. All rights reserved.

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

% for my $art (@$articles) {
%     my $elem = $art->get_element;
%     my $uri = $burner->best_uri($art)->as_string;
          <div class="archiveitem">
            <h2><a href="<% $uri %>" title=""><% $art->get_title %></a></h2>
            <p class="date"><% $art->get_cover_date('%Y.%m.%d') %></p>
            <p><% $elem->get_data('long_teaser') || $elem->get_data('teaser') || $elem->get_data('paragraph') %></p>
            <p class="more"><a href="<% $uri %>" title="">Read More</a></p>
          </div>
% }
% if ($prev || $next) {
          <div id="pagenav">
%     if ($prev) {
           <p id="pageprev"><a href="<% $prev %>" title="">Newer stories</a></p>
%     }
%     if ($next) {
           <p id="pagenext"><a href="<% $next %>" title="">Older stories</a></p>
%     }
          </div>
% }
<%once>;
my $limit = 25;
</%once>\
<%init>;
my $offset = $burner->notes('last_offset') || 0;
my $cat = $burner->get_cat->get_uri;
$cat = undef if $cat eq '/archive/';
my $articles = $m->comp(
    '/util/archive_list.mc',
    offset   => $offset,
    limit    => $limit,
    category => $cat,
);
my $prev = $burner->prev_page_file;
my $next;
if (@$articles >= $limit) {
    # Set it up to burn another page.
    $burner->notes(last_offset => $offset + $limit);
    $burner->set_burn_again(1);
    $next = $burner->next_page_file;
} else {
    # Reset the offset so that any other archives published by the same
    # request won't be broken.
    $burner->notes(last_offset => 0);
}
</%init>\
<%method .rss>
% # Find the RSS output channel and output the link.
% my ($oc) = Bric::Biz::OutputChannel->list({ name => 'RSS', site_id => $story->get_site_id });
    <link rel="alternate" type="application/rss+xml" title="Bricolage CMS <% encode_entities($story->get_title) %> RSS Feed" href="<% $story->get_uri(undef, $oc) . '/rss.xml' %>" />
</%method>\
<%doc>

=pod

=head1 Name

/archive.mc - XHTML output for Bricolage CMS archives

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

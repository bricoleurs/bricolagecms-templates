          <h1>Recent News</h1>
          <dl>
<%perl>;
my $cat = $burner->get_cat->get_uri;
$cat = undef if $cat eq '/archive/';
for my $art (@{ $m->comp('/util/archive_list.mc', category => $cat) }) {
    my $elem = $art->get_element;
    $m->comp('/util/xhtml/output_link.mc',
             url  => $burner->best_uri($art)->as_string,
             text => $art->get_title,
             teas => $elem->get_data('teaser') || $elem->get_data('paragraph'),
             date => $art->get_cover_date('%Y.%m.%d'),
    );
}
</%perl>
          </dl>
          <p class="more"><a href="<% $burner->best_uri($story) %>" title="<% encode_entities $story->get_title %>">Older stories</a></p>
<%doc>

=pod

=head1 Name

/archive.mc - Outputs a Mason component for a an archive document on the Bricolage CMS site

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

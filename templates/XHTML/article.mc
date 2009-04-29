          <div id="articlemeta">
% my $templators = $m->scomp('/util/text/contributor_list.mc', type => 'Templators');
% if (my $by = $m->scomp('/util/text/contributor_list.mc', type => 'Writers')) {
%     $by .= "; Templating by $templators" if $templators;
            <p class="byline">By <% $by %></p>
% } elsif ($templators) {
            <p class="byline">Templating by <% $templators %></p>
% }
            <p class="date"><% $story->get_cover_date('%Y.%m.%d') %></p>
          </div>
% $m->comp('/util/xhtml/output_body.mc', %ARGS);
<%cleanup>;
return unless $burner->get_mode == PUBLISH_MODE;
unless ($story->get_publish_status) {
    $story->set_publish_status(1);
    $story->save;
}

# We need to look up all the archives in /archive, the current category, and
# the parent categories of the current category.
my $cat = $burner->get_cat->get_uri;
my @cats = ('/archive/', $cat);
while ($cat =~ s|[^/]+/$||) {
    push @cats, $cat;
}

my @archives = Bric::Biz::Asset::Business::Story->list({
    element_key_name  => 'archive',
    primary_uri       => ANY(@cats),
    unexpired         => 1,
    publish_status    => 1,
    published_version => 1,
});
$burner->publish_another($_) for @archives;
</%cleanup>\
<%doc>

=pod

=head1 Name

/article.mc - XHTML output for Bricolage CMS site articles

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

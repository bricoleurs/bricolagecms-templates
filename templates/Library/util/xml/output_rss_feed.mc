<%args>
@docs
$title => undef
</%args>
<%init>;
my $url = 'http://' .
  Bric::Biz::Site->lookup({ id => $story->get_site_id })->get_domain_name;
my $rss = XML::RSS->new(encoding => 'utf-8' );
$title ||= 'Bricolage.cc ' . $story->get_title;
$rss->channel(
    title       => $title,
    link        => $url . $story->get_primary_uri . '/',
    description => $story->get_title,
    dc          => {
        rights    => 'Copyright ' . ht_time(time, '%Y')
                     . " Bricolage Developers",
        language  => 'en-us',
        creator   => 'www@bricolage.cc',
        publisher => 'www@bricolage.cc',
    },
);

for my $doc (@docs) {
    my $elem = $doc->get_element;
    my $desc = $elem->get_data('long_teaser') || $elem->get_data('teaser')
      || $elem->get_data('paragraph');
    $rss->add_item(
        title       => $doc->get_title,
        link        => $url . $doc->get_primary_uri,
        description => $desc,
        dc          => { date => $doc->get_cover_date('%Y-%m-%dT%H:%M:%S%z') },
    );
}
$m->clear_buffer;
$m->print( $rss->as_string );
return;
</%init>\
<%doc>

=pod

=head1 Name

/util/xml/output_rss_feed.mc - Outputs an RSS feed for a list of documents on bricolage.cc

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

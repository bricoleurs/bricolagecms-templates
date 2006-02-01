<%perl>;
my $cat = $burner->get_cat->get_uri;
$cat = undef if $cat eq '/archive/';
$m->comp(
    '/util/xml/output_rss_feed.mc',
    title => 'Bricolage News',
    docs  => $m->comp(
        '/util/archive_list.mc',
        limit => 15,
        category => $cat,
    )
);
</%perl>\
<%doc>

=pod

=head1 Name

/archive.mc - Outputs an RSS feed for a an archive document on bricolage.cc

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright & License

Copyright (c) 2004-2006 David Wheeler & Kineticode. All rights reserved.

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

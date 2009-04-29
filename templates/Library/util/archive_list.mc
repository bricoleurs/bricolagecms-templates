<%args>
$limit    => 5
$offset   => 0
$category => undef
</%args>
<%once>;
my $developers_source_id = 1;
</%once>\
<%init>;
return scalar Bric::Biz::Asset::Business::Story->list({
    element_key_name => 'article',
    Order            => 'cover_date',
    OrderDirection   => 'DESC',
    Offset           => $offset,
    Limit            => $limit,
    unexpired        => 1,
    source_id        => $developers_source_id, # Exclude Introspection.
    # Limit to a category?
    ( defined $category
      ? (category_uri => "$category%")
      : ()
    ),
    # Are we publishing?
    ( $burner->get_mode == PUBLISH_MODE
      ? (
          # Only return published articles.
          publish_status => '1',
        )
      : ()
    )
});
</%init>
<%doc>

=pod

=head1 Name

/util/archive_list.mc - Returns a list of articles for use in the Bricolage CMS site archives

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

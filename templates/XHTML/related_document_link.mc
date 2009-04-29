<%init>;
my $doc = $element->get_related_story;
unless ($doc) {
  return if $burner->get_mode == PUBLISH_MODE;
  $burner->throw_error('You forgot to relate a document');
}
$m->comp(
    '/util/xhtml/output_link.mc',
    url  => $burner->best_uri($doc)->as_string,
    text => $element->get_data('link_text') || $doc->get_title,
    tip  => encode_entities($element->get_data('tooltip')),
    teas => $element->get_data('teaser')
         || $doc->get_element->get_data('teaser'),
    date => $doc->is_fixed ? undef : $doc->get_cover_date('%Y.%m.%d'),
);
return;
</%init>\
<%doc>

=pod

=head1 Name

/related_document_link.mc - XHTML output for related document links on the Bricolage CMS site

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

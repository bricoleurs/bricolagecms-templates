<%perl>
my $url = encode_entities($element->get_data('url'));
my $title = $element->get_data('link_text');
unless ($url && $title) {
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You forgot to specify a URL and/or title');
}
$m->comp(
    '/util/xhtml/output_link.mc',
    url  => $url,
    text => $title,
    tip  => encode_entities($element->get_data('tooltip')),
    teas => $element->get_data('teaser')
);
return;
</%perl>\
<%doc>

=pod

=head1 Name

/related_external_link.mc - XHTML output for related external links on the Bricolage CMS site

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

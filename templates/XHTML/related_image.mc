          <div class="relimage float<% $element->get_data('position') || 'right' %>" style="width: <% $w %>px;">
            <img src="<% $burner->best_uri($image)->as_string %>" alt="<% $alt %>" />
% if ( defined $caption && $caption ne '' ) {
            <p class="caption"><% $caption %></p>
% }
          </div> 
<%init>;
my $image = $element->get_related_media;

unless ($image) {
    # Throw an error or return.
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You forgot to relate an image');
}

my $type  = $image->get_media_type->get_name;

unless ( $type =~ /^image/ ) {
    # Oops, it's not an image file!
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error($image->get_uri . ' is not an image');
}

my $ielem = $image->get_element;
my $w = $ielem->get_data('width');
my $caption = $element->get_data('caption') || $ielem->get_data('caption');
my $alt = encode_entities($element->get_data('alt_text') || '');
</%init>\
<%doc>

=pod

=head1 Name

/related_image.mc - XHTML output for related images on the Bricolage CMS site

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

<%args>
$type
$tip
</%args>
<%init>;
my $shot = $element->get_related_media;
unless ($shot) {
    # Throw an error or return.
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error( 'You forgot to relate an image to element #'
                          . $element->get_place + 1 . ', '
                          . $element->get_name);
}

my $w = $element->get_data('width');
my $h = $element->get_data('height');
my $uri = $burner->best_uri($shot)->as_string;
$m->print(qq{                    <li><a href="$uri" title="$tip ($type)" },
          qq{onclick="return popup(this, $w, $h)">$type</a></li>\n});
return;
</%init>\
<%doc>

=pod

=head1 Name

/link_to_screenshot_image.mc - XHTML output for links to screenshot images on bricolage.cc

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

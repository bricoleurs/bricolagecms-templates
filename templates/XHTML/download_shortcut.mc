<%init>;
my $download = $element->get_related_media;
unless ($download) {
  return if $burner->get_mode == PUBLISH_MODE;
  $burner->throw_error("You neglected to relate a downloadable document to "
		       . "Download Shortcut # " . $element->get_place);
}
my $tip = escape_html($element->get_data('tooltip'));
my $uri = $burner->best_uri($download)->as_string;
my $text = $element->get_data('link_text') || $download->get_title;
my $desc = $element->get_data('description');
$desc = defined $desc ? " ($desc)" : '';
$m->print(qq{              <dd><a href="$uri" title="$tip">$text</a>$desc</dd>\n});
return;
</%init>\
<%doc>

=pod

=head1 Name

/download_shortcut.mc - XHTML output for download shortcuts on bricolage.cc

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

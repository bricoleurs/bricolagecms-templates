          <div id="downloadbox">
            <dl>
              <dt><a href="<% $uri %>" title="<% $tip %>">Download Now!</a></dt>
              <dd class="current">(<% $text %>)</dd>
              <dd class="more"><a href="/downloads/" title="Older releases and other downloads">More Downloads</a></dd>
            </dl>
          </div>
<%init>;
my $download = $element->get_related_media;
unless ($download) {
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You neglected to relate a downloadable document');
}
my $tip = encode_entities($element->get_data('tooltip'));
my $uri = $burner->best_uri($download)->as_string;
my $text = $element->get_data('link_text') || $download->get_title;
</%init>\
<%doc>

=pod

=head1 Name

/download_shortcut.mc - XHTML output for download shortcuts on the Bricolage CMS site

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

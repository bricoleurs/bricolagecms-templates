          <div class="person">
% if ($element->get_related_media) {
%     $m->comp('/related_image.mc');
% }
            <h2><% $element->get_data('name') %></h2>
% if (my $job = $element->get_data('responsibilities')) {
            <p><% $job %></p>
% }
            <dl>
% if (my $url = $element->get_data('site_url')) {
%     my $text = $element->get_data('site_name') || $url;
%     $text =~ s{^\w+://}{};
              <dt>Web Site</dt>
              <dd><p><a href="<% encode_entities($url) %>" title="Visit <% encode_entities($text) %>"><% $text %></a><p></dd>
% }
% for my $p (@parts) {
%     my $val = $element->get_data($p->[0]) or next;
              <dt><% $p->[1] %></dt>
              <dd><p><% $val %><p></dd>
% }
            </dl>
% if ($element->get_data('bio')) {
            <h3>Bio</h3>
%     for my $e ($element->get_elements('bio')) {
            <p><% $e->get_data %><p>
%     }
% }
          </div>
<%once>;
my @parts = (
#   [ email            => 'Email'            ],
#   [ site_name        => 'Site Name'        ],
#   [ site_url         => 'Site URL'         ],
    [ irc_nick         => 'IRC Nick'         ],
    [ location         => 'Location'         ],
#   [ responsibilities => 'Responsibilities' ],
);
</%once>\
<%doc>

=pod

=head1 Name

/personal_profile.mc - XHTML output for personal profiles on the Bricolage CMS site

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

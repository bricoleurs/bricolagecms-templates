              <div class="shot">
                <div class="shotimg"><a href="<% $burner->best_uri($full)->as_string %>" title="<% $tip %>" onclick="return popup(this, <% $fw %>, <% $fh %>)"><img src="<% $burner->best_uri($thumb)->as_string %>" alt="<% $alt %>" style="width: <% $w %>px; height: <% $h %>px;" /></a></div>
                <div class="shotinfo">
                  <h2><% $element->get_data('title') %></h2>
                  <p><% $element->get_data('description') %></p>
                  <ul>
<%perl>;
for my $type qw(full half tiff pdf) {
    $burner->display_element($img{$type},
                             type => $labels{$type},
                             tip  => $tip)
      if $img{$type};
}
</%perl>\
                  </ul>
                </div>
              </div>
<%once>;
my %labels = (
  full => 'Full size',
  half => 'Half size',
  tiff => 'TIFF',
  pdf  => 'PDF',
);
</%once>\
<%init>;
my %img = map { $_->get_data('type') => $_ }
  $element->get_elements('link_to_screenshot_image');

unless ($img{thumb} && $img{full}) {
    # Throw an error or return.
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You forgot to add full and/or thumbnail Link');
}

my $thumb = $img{thumb}->get_related_media;
my $full =  $img{full}->get_related_media;
for my $e ($full && $thumb) {
    unless ($e) {
        # Throw an error or return.
        return if $burner->get_mode == PUBLISH_MODE;
        $burner->throw_error('You forgot to relate an image');
    }
}

my $tip = $element->get_data('tooltip');
$tip = '' unless defined $tip;
my $alt = $element->get_data('alt_text');
$alt = '' unless defined $alt;
my $w = $thumb->get_data('width');
my $h = $thumb->get_data('height');
my $fw = $full->get_element->get_data('width');
my $fh = $full->get_element->get_data('height');
</%init>\
<%doc>

=pod

=head1 Name

/screenshot.mc - XHTML output for screenshots on the Bricolage CMS site

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

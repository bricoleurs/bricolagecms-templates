          <div class="relaudio float<% $element->get_data('position') || 'right' %>"><div>
            <h2><% $element->get_data('title') %></h2>
% if ( defined $caption ) {
            <p class="caption"><% $caption %></p>
% }
            <p class="link"><a href="<% $burner->best_uri($audio)->as_string %>" title="<% $tip %>"><% $text %></a></p>
          </div></div>
<%init>;
my $audio = $element->get_related_media;

unless ($audio) {
    # Throw an error or return.
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You forgot to relate an audio file');
}

my $type  = $audio->get_media_type->get_name;

unless ( $type =~ /^audio/ ) {
    # Oops, it's not a audio!
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error( $audio->get_uri . ' is not an audio file');
}

my $caption = $element->get_data('caption')
  || $audio->get_element->get_data('caption');
my $text = $element->get_data('link_text') || $audio->get_title;
my $tip = $element->get_data('tooltip');
$tip = '' unless defined $tip;
</%init>\
<%doc>

=pod

=head1 Name

/related_audio.mc - XHTML output for related audio files on the Bricolage CMS site

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

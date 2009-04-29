<%init>;
my $class = $burner->notes('first_nav') ? '' : ' class="first"';
my $rel_story = $element->get_related_story;
unless ($rel_story) {
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You forgot to relate a document');
}
my $tip = encode_entities($element->get_data('tooltip'));
my $uri = $burner->best_uri($rel_story)->as_string;
my $text = $element->get_data('link_text') || $rel_story->get_title;
$m->print(qq{        <li$class><a href="$uri" title="$tip">$text</a></li>\n});
$burner->notes(first_nav => 1);
return;
</%init>\
<%doc>

=pod

=head1 Name

/external_nav_link.mc - Outputs a link to a document for use in the Bricolage CMS site nav menus

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

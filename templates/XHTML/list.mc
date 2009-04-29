        <div class="list">
% if (my $title = $element->get_data('title')) {
          <h4><% $title %></h4>
% }
% my $tag = $element->get_data('type') || 'ul';
          <<% $tag %>>
<%perl>;
my $in_item = 0;
foreach my $e ( $element->get_elements(qw(item paragraph code list
                                          link_to_document_item
                                          external_link_item))) {
    my $kn = $e->get_key_name;
    if ($kn eq 'item') {
        # Finish the last list item, if we were in one, and start a new one.
        $m->print("</li>\n") if $in_item;
        $m->print("            <li><p>", $e->get_data, "</p>");
        $in_item = 1;
    } elsif ($kn eq 'link_to_document_item' || $kn eq 'external_link_item') {
        # Finish the last list item, if we were in one, and output the link
        # item.
        $m->print("</li>\n") if $in_item;
        $in_item = 0;
        $burner->display_element($e);
    } else {
        # Make sure the paragraph or list doesn't come before an item.
        $burner->throw_error( "You cannot have a $kn in a list before the "
                              . "first item." )
          if $burner->get_mode != PUBLISH_MODE && ! $in_item;
        if ($kn eq 'paragraph') {
            # Just output a paragraph, which is a subelement of an item.
            $m->print("\n              <p>", $e->get_data, "</p>");
        } elsif ($kn eq 'code') {
            # Just output a preformatted field as a subelement of an item.
            (my $code = encode_entities($e->get_data)) =~ s/'/&#x0027;/g;
            $m->print("\n              <pre><%text>$code</%text></pre>");
        } else {
            # If it's a list, we're embedded!
            $burner->display_element($e);
        }
    }
}
$m->print("</li>\n") if $in_item;
</%perl>\
          </<% $tag %>>
        </div>
<%doc>

=pod

=head1 Name

/list.mc - XHTML output for lists on the Bricolage CMS site

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

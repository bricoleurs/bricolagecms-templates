          <div id="screenshots">
<%perl>;
if ($next_shot == 1) {
    # Output paragraphs on the first page.
    $m->print('            <p>', $_->get_value, "</p>\n")
        for $element->get_elements('paragraph');
}
for my $i ($next_shot .. $last_shot) {
    $burner->display_element($element->get_container('screenshot', $i));
}
</%perl>\
          </div>
% if ($prev || $next) {
          <div id="pagenav">
%     if ($prev) {
           <p id="pageprev"><a href="<% $prev %>" title="">Previous screenshots</a></p>
%     }
%     if ($next) {
           <p id="pagenext"><a href="<% $next %>" title="">More screenshots</a></p>
%     }
          </div>
% }
<%init>;
my $next_shot = $burner->notes('next_shot') || 1;
my $last_shot = $next_shot + 4;
my $prev = $burner->prev_page_file;
my $next;
if ($element->get_container('screenshot', $last_shot + 1)) {
    # There will be more.
    $burner->notes(next_shot => $last_shot + 1);
    $burner->set_burn_again(1);
    $next = $burner->next_page_file;
}
</%init>\
<%doc>

=pod

=head1 Name

/screenshots.mc - XHTML output for screenshot documents on the Bricolage CMS site

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

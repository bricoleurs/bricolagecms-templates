          <div id="faq">
            <ul class="toc">
<%perl>;
my $i;
while (my $e = $element->get_container('faq_section', ++$i)) {
    $m->print('              <li>', $e->get_data('title'), "<ul>\n");
    my $n;
    while (my $q = $e->get_container('faq_question', ++$n)) {
        $m->print(qq{                <li><a href="#s${i}q$n">},
                  $q->get_data('question_paragraph'), "</a></li>\n");
    }
    $m->print("              </ul></li>\n");
}
</%perl>
            </ul>
% $burner->display_element($_) for $element->get_elements('faq_section');
          </div>
<%doc>

=pod

=head1 Name

/faq.mc - XHTML output for FAQs on the Bricolage CMS site

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

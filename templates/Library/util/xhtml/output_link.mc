% $tip = '' unless defined $tip;
            <dt><a href="<% $url %>" title="<% $tip %>"><% $text %></a></dt>
            <dd>
<% $date ? qq{              <p class="date">$date</p>\n} : '' %>\
<% $teas ? "              <p>$teas</p>\n" : '' %>\
            </dd>
<%args>
$url
$text
$tip => ''
$teas => undef
$date => undef
</%args>\
<%doc>

=pod

=head1 Name

/util/xhtml/output_link.mc - Outputs a definition list link for XHTML output for bricolage.cc

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright & License

Copyright (c) 2004-2006 David Wheeler & Kineticode. All rights reserved.

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

<?xml version="1.0" encoding="utf-8"?>

<rdf:RDF
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
 xmlns="http://purl.org/rss/1.0/"
 xmlns:cc="http://web.resource.org/cc/"
 xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:syn="http://purl.org/rss/1.0/modules/syndication/"
 xmlns:admin="http://webns.net/mvcb/"
>
  <channel rdf:about="http://www.bricolage.cc<% $story->get_primary_uri %>/">
    <title><% escape_html $story->get_title %></title>
    <link><% $story->get_uri %>/</link>
    <description><% escape_html $story->get_description || $story->get_title %></description>
    <cc:license rdf:resource="http://creativecommons.org/licenses/by-nc/2.0" />
    <dc:language>en-us</dc:language>
    <dc:rights>Copyright <% ht_time(time, '%Y') %> Bricolage Developers</dc:rights>
    <dc:publisher>www@bricolage.cc</dc:publisher>
    <dc:creator>www@bricolage.cc</dc:creator>
    <items>
      <rdf:Seq>
% for my $doc (@docs) {
        <rdf:li rdf:resource="http://www.bricolage.cc<% $doc->get_primary_uri %>/" />
% }
      </rdf:Seq>
    </items>
  </channel>
% for my $doc (@docs) {
%     my $url = 'http://www.bricolage.cc' . $doc->get_primary_uri . '/';
%     my $elem = $doc->get_element;
%     # Damn RSS readers don't recognize XHTML in the title.
%     (my $title = $doc->get_title) =~ s|</?[^>]+>||g;
  <item rdf:about="<% $url %>">
    <title><% escape_html $title %></title>
    <link><% $url %></link>
    <description><% escape_html(scalar $elem->get_data('long_teaser') || scalar $elem->get_data('teaser') || scalar $elem->get_data('paragraph')) %></description>
    <cc:license rdf:resource="http://creativecommons.org/licenses/by-nc/2.0" />
    <dc:date><% $doc->get_cover_date('%Y-%m-%dT%H:%M:%S%z') %></dc:date>
  </item>
% }
  <License rdf:about="http://creativecommons.org/licenses/by-nc/2.0/">
    <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
    <permits rdf:resource="http://web.resource.org/cc/Distribution" />
    <requires rdf:resource="http://web.resource.org/cc/Notice" />
    <requires rdf:resource="http://web.resource.org/cc/Attribution" />
    <prohibits rdf:resource="http://web.resource.org/cc/CommercialUse" />
    <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
  </License>
</rdf:RDF>
<%args>
@docs
$title => undef
</%args>\
<%doc>

=pod

=head1 Name

/util/xml/output_rss_feed.mc - Outputs an RSS feed for a list of documents on bricolage.cc

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

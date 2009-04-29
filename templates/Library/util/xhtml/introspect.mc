<%doc>

=head1 Name

introspect.mc - Outputs a graphical representation of a story type element tree

=head1 Version

1.2

=head1 Synopsis

  <& /util/xhtml/introspect.mc &>

=head1 Description

This template outputs a graphical representation of the element type structure
of a story type element. To see examples of its output, visit
L<http://www.bricolagecms.org/about/doc_models/> on the Bricolage Website.

To use this template, simply create a template for your story element type,
have it execute this template, and you're done. Create a new document for the
story element type and preview it.

The output is XHTML 1.1, containing a series of embedded C<< <div> >>s, each
representing a single element type in the element type tree. Each contains
data about the element type, any fields and any subelement types, as well as
metadata about the element type itself (name, key name, related story, etc.).
The story element type itself also includes a list of associated sites and
output channels.

This template is smart enough to correctly handle recursive element types. It
also has embedded CSS to make the whole thing look nice, with colors to
distinguish up to ten levels of the element type tree. Patches to make it look
even nicer are warmly welcomed.

=head1 Parameters

=over 4

=item full_page

  $m->comp('/util/xhtml/introspect.mc', full_page => 0);

Pass a false value to this parameter to prevent the template from outputting a
complete XHTML page. That is, if you want to handle the output of the
C<< <html> >>, C<< <head> >>, and C<< <body> >> tags yourself, pass a false
value. Defaults to true.

=item include_css

  $m->comp('/util/xhtml/introspect.mc', include_css => 0);

Pass a false value to this parameter to prevent the template from outputting
its default CSS. True by default.

=item include_toc

  $m->comp('/util/xhtml/introspect.mc', include_toc => 0);

Pass a false value to this parameter to prevent the template from outtputing a
nested table of contents of all of the element types in the document model.

=head1 Prerequisites

=over 4

=item Bricolage 1.10

=back

=head1 Author

David Wheeler <david@kineticode.com>

=head1 Copyright and License

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
% if ($full_page) {
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
% }
% if ($include_css) {
    <style type="text/css">
#docmodel {
  font: verdana, arial, sans-serif;
}

#docmodel .toc ul {
  margin: 0;
}

#docmodel h2 {
  margin-bottom: .5em;
}

#docmodel .element {
  border-top: 1px solid black;
  border-left: 1px solid black;
}

#docmodel .element h1 { font-size: 1.4em; margin: 0; }
#docmodel .element h2 { font-size: 1.2em; margin: .5em 0 .2em 0; }

#docmodel .element table {
  border-spacing: 0;
  border-left: 1px solid black;
  border-top: 1px solid black;
}

#docmodel .element,
#docmodel .fields tr,
#docmodel .fields td,
#docmodel .fields th,
#docmodel .sites tr,
#docmodel .sites td,
#docmodel .sites th {
  border-bottom: 1px solid black;
  border-right: 1px solid black;
  margin: 0;
  padding: .2em;
  vertical-align: top;
}

#docmodel .fields { width: 100%; }

#docmodel .element {
  padding: 1em;
  margin-bottom: 1em;
}

#docmodel .element dt {
  font-weight: bold;
  float: left;
  padding-right: .5em;
}

#docmodel .element td ul {
  list-style: square;
  margin: 0 0 0 1.5em;
  padding: 0;
}

#docmodel .sites td ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

#docmodel li.primary {
  font-weight: bold;
}

#docmodel li.primary:after { content: " \2714"; }
#docmodel .element dt:after { content: ":" }

/* Colors */
#docmodel .level1  { background: #fbfbd8; }
#docmodel .level2  { background: #eed2ee; }
#docmodel .level3  { background: #add8e6; }
#docmodel .level4  { background: #e1f5ba; }
#docmodel .level5  { background: #ffe4e1; }
#docmodel .level5  { background: #7fffd4; }
#docmodel .level6  { background: #ffec8b; }
#docmodel .level7  { background: #ffc1c1; }
#docmodel .level8  { background: #87ceeb; }
#docmodel .level9  { background: #deb887; }
#docmodel .level10 { background: #ff6347; }
    </style>
% }
% if ($full_page) {
    <title><% $element->get_name %></title>
    <meta name="generator" content="Bricolage <% Bric->VERSION %>" />
  </head>
  <body>
% }
    <div id="docmodel">
% my $elem_type = $element->get_element_type;
% if ($include_toc) {
      <div class="toc">
        <h2>Element Table of Contents</h2>
        <ul>
%     $m->comp('.toc', elem_type => $elem_type);
        </ul>
      </div>
%     %seen = ();
% }
      <h2>Docment Model</h2>
% $m->comp('.element', elem_type => $elem_type);
    </div>
% if ($full_page) {
  </body>
</html>
% }
<%args>
$include_css => 1
$full_page   => 1
$include_toc => 1
</%args>\
<%once>;
my $meta = 'html_info';
</%once>\
<%shared>
my %seen;
</%shared>\
<%def .toc>\
<%args>
$elem_type
$no_nest => 0
$level   => 1
</%args>\
<%perl>;
my $kn = $elem_type->get_key_name;
$seen{$kn}++;
$m->print(qq{        <li><a href="#$kn$level">}, $elem_type->get_name, "</a>");
my @subs = $elem_type->get_containers
 or $m->print("</li>\n"), return;
my $kn1 = $subs[0]->get_key_name;
if ($seen{$kn} > 1 || (@subs == 1 && $no_nest && $kn1 eq $kn)) {
    $m->print("</li>\n");
    return;
}
$m->print(qq{\n        <ul>\n});
for my $sub (@subs) {
    my $subkn = $sub->get_key_name;
    my $nest = $subkn eq $kn;
    next if $seen{$subkn} > 1 || ($nest && $no_nest);
    $m->comp('.toc',
        elem_type => $sub,
        level     => $level + 1,
        no_nest   => $nest
    );
}
$m->print(qq{          </ul>\n        </li>\n});
</%perl>\
</%def>\
<%def .element>\
<%args>
$elem_type
$level   => 1
$no_nest => 0
</%args>\
% my $kn = $elem_type->get_key_name;
% $seen{$kn}++;
    <div class="element level<% $level %>" id="<% $kn . $level %>">
      <h1><% $elem_type->get_name %></h1>
      <dl>
        <dt>Key Name</dt>
        <dd><% $kn %></dd>
        <dt>Type</dt>
        <dd><% $elem_type->get_type_name %></dd>
        <dt>Paginated</dt>
        <dd><% $elem_type->is_paginated ? 'Yes' : 'No' %></dd>
        <dt>Related Media</dt>
        <dd><% $elem_type->is_related_media ? 'Yes' : 'No' %></dd>
        <dt>Related Story</dt>
        <dd><% $elem_type->is_related_story ? 'Yes' : 'No' %></dd>
% if ($elem_type->is_top_level) {
        <dt>Fixed URI</dt>
        <dd><% $elem_type->is_fixed_uri ? 'Yes' : 'No' %></dd>
% }
        <dt>Description</dt>
        <dd><% $elem_type->get_description || '&nbsp;' %></dd>
      </dl>
% if ($elem_type->is_top_level) {
      <h2>Sites &amp; Output Channels</h2>
      <table class="sites">
        <tr>
          <th>Site</th>
          <th>Output Channels</th>
        </tr>
% my %ocs; push @{$ocs{$_->get_site_id}}, $_ for $elem_type->get_output_channels;
%     for my $site ($elem_type->get_sites) {
%         my $prim = $elem_type->get_primary_oc_id($site->get_id);
        <tr>
          <td><% $site->get_name %></td>
          <td>
            <ul>
%         for my $oc (@{$ocs{$site->get_id}}) {
%             my $attr = $oc->get_id == $prim
%               ? ' class="primary" title="Primary Output Channel"'
%               : '';
              <li<% $attr %>><% $oc->get_name %></li>
%         }
            </ul>
          </td>
        </tr>
%     }
      </table>
% }
% if (my @fields = $elem_type->get_data) {
      <h2>Fields</h2>
      <table class="fields">
        <tr>
          <th>Place</th>
          <th>Key Name</th>
          <th>Label</th>
          <th>Widget</th>
          <th>Default</th>
          <th>Length</th>
          <th>Max Length</th>
          <th>Required</th>
          <th>Values</th>
        </tr>
%     for my $field (@fields) {
        <tr>
          <td><% $field->get_place %></td>
          <td><% $field->get_key_name %></td>
          <td><% $field->get_name %></td>
          <td><% $field->get_widget_type %></td>
          <td><% $field->get_default_val %></td>
          <td><% $field->get_length %></td>
          <td><% $field->get_max_length %></td>
          <td><% $field->get_required ? 'Yes' : 'No' %></td>
%         if (my $vals = $field->get_vals) {
          <td>
            <ul>
%             for my $line (split /\n/, $vals)  {
%                 my ($val, $label) = split /,/, $line; $label ||= $val;
              <li><% "$val => $label" %></li>
%             }
            </ul>
          </td>
%         } else {
          <td>&nbsp;</td>
%         }
        </tr>
%     }
      </table>
% }
<%perl>;
if (my @subs = $elem_type->get_containers) {
    my $kn1 = $subs[0]->get_key_name;
    unless ($seen{$kn} > 1 || (@subs == 1 && $no_nest && $kn1 eq $kn)) {
        $m->print("      <h2>Subelements</h2>\n");
        for my $sub (@subs) {
            my $subkn = $sub->get_key_name;
            my $nest = $subkn eq $kn;
            next if $seen{$subkn} > 1 || ($nest && $no_nest);
            $m->comp('.element',
                elem_type => $sub,
                level     => $level + 1,
                no_nest   => $nest
            );
        }
    }
}
$seen{$kn}--;
</%perl>\
    </div>
</%def>\

% $m->comp('/util/xhtml/output_body.mc', %ARGS);
% for my $model (@models) {
%     my $uri = $burner->best_uri($model)->as_string;
          <div class="archiveitem">
            <h2><a href="<% $uri %>" title=""><% $model->get_title %></a></h2>
            <p><% $model->get_description || $model->get_element->get_element_type->get_description %></p>
          </div>
% }
<%init>;
my @models = Bric::Biz::Asset::Business::Story->list({
    Order            => 'title',
    unexpired        => 1,
    primary_uri      => '/about/doc_models/%',
    # Are we publishing?
    ( $burner->get_mode == PUBLISH_MODE
      ? (
          # Only return published document models.
          publish_status => '1',
        )
      : ()
    )
});
</%init>\
<%doc>

=pod

=head1 Name

/document_models.mc - XHTML output of a list of document models on the Bricolage CMS site

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

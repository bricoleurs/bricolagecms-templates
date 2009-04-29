<%init>;
my $download = $element->get_related_media;
unless ($download) {
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error('You neglected to relate a download document');
}

unless ($download->get_element_key_name eq 'download') {
    return if $burner->get_mode == PUBLISH_MODE;
    $burner->throw_error($download->get_uri . ' is not a download file');
}

my $tip = encode_entities($element->get_data('tooltip'));
my $uri = $burner->best_uri($download)->as_string;
my $text = $element->get_data('link_text') || $download->get_title;
my $date = $element->get_data('release_date', 1, $fmt)
  || $download->get_cover_date($fmt);

my $log_url;
if (my $log = $element->get_related_story) {
    $log_url = $burner->best_uri($log)->as_string;
} else {
    $log_url = encode_entities $element->get_data('changelog_url');
}

unless ($log_url) {
    $burner->throw_error(
        'You left out the changelog URL for '
        . $download->get_uri
    ) unless $burner->get_mode == PUBLISH_MODE;
    $log_url = '';
}

my $md5 = Digest::MD5->new->addfile($download->get_file)->hexdigest;

$m->print(qq{            <li><a href="$uri" title="$tip">$text</a> ($date) },
          qq{<span class="small">[ <a href="$log_url">Changelog</a> ] (MD5: $md5)</span></li>\n});
return;
</%init>
<%once>
my $fmt = '%Y.%m.%d';
</%once>\
<%doc>

=pod

=head1 Name

/link_to_download.mc - XHTML output for links to downloads on the Bricolage CMS site

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

package Module::Starter::Plugin::TT2;

our $VERSION = '0.10';

use Template;

use warnings;
use strict;

=head1 NAME

Module::Starter::Plugin::TT2 - TT2 templates for Module::Starter::Template

=head1 SYNOPSIS

 use Module::Starter qw(
   Module::Starter::Simple
   Module::Starter::Plugin::Template
   Module::Starter::Plugin::TT2
     ...
 );

 Module::Starter->create_distro( ... );

=head1 DESCRIPTION

This Module::Starter plugin is intended to be loaded after
Module::Starter::Plugin::Template.  It implements the C<renderer> and C<render>
methods, required by the Template plugin.  The methods are implemented with
Template Toolkit.

This module's distribution includes a directory, C<templates/dir>, and a file
C<templates/inline> that contain stock templates for use with the InlineStore
and DirStore plugins.

=head1 METHODS

=head2 C<< renderer >>

As implemented, this method just creates a new Template Toolkit engine and
stores it in the Module::Starter object.

=cut

sub renderer { my $renderer = Template->new; }

=head2 C<< render( $template, \%options ) >>

This method passes the given template contents and options to the TT2 renderer
and returns the resulting document.

=cut

sub render {
    my $self = shift;
    my $template = shift;
    my $options = shift;
    my $output;

    $options->{self} = $self;
    $options->{year} = $self->_thisyear;

    $self->renderer->process(\$template, $options, \$output);
    return $output;
}

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 COPYRIGHT

Copyright 2004 Ricardo SIGNES, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;

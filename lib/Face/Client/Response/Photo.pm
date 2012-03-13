package Face::Client::Response::Photo;

use 5.006;
use strict;
use warnings;

use Face::Client::Response::Tag;

=head1 NAME

Face::Client::Photo

=head1 VERSION

Version 0_01

=cut

our $VERSION = '0_02';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Face::Client;

    my $foo = Face::Client->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
    my $class  = shift;
    my $params = shift;

    my $self = bless {},$class;

    for my $key ( keys %$params ) {
            $self->{$key} = $params->{$key};
    }
    

        if ( $params->{tags}  ) {
            my @tags;
            for my $tag ( @{ $params->{tags} } ) {
                # Add a reference back to the parent photo
                $tag->{photo} = $self;
                push @tags, Face::Client::Response::Tag->new($tag);
            }
            @{$self->{tags}} = @tags;
        }

    return $self;
}

=head2 width

Getter for the width attribute

=cut

sub width {
    my $self = shift;

    return $self->{'width'};
}

=head2 height

Getter for the height attribute

=cut

sub height {
    my $self = shift;

    return $self->{'height'};
}

=head2 url

Getter for the url attribute

=cut

sub url {
    my $self = shift;

    return $self->{'url'};
}

=head2 pid

Getter for the pid attribute

=cut

sub pid {
    my $self = shift;

    return $self->{'pid'};
}

=head2 tags

Getter for the tags attribute

=cut

sub tags {
    my $self = shift;

    return @{$self->{'tags'}};
}

=head1 AUTHOR

Arnaud (Arhuman) ASSAD, C<< <arhuman at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-face-client at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Face-Client>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Face::Client


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Face-Client>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Face-Client>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Face-Client>

=item * Search CPAN

L<http://search.cpan.org/dist/Face-Client/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Arnaud (Arhuman) ASSAD.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Face::Client

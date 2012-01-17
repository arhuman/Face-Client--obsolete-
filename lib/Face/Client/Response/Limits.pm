package Face::Client::Response::Limits;

use 5.006;
use strict;
use warnings;

=head1 NAME

Face::Client::Response::Limits

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0_01';

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

    my $self = {};

    for my $key ( keys %$params ) {
        $self->{$key} = $params->{$key};
    }

    return bless( $self, $class );
}


=head2 used

Getter for the used attribute

=cut

sub used {
    my $self = shift;

    return $self->{'used'};
}

=head2 remaining

Getter for the remaining attribute

=cut

sub remaining {
    my $self = shift;

    return $self->{'remaining'};
}

=head2 limit

Getter for the limit attribute

=cut

sub limit {
    my $self = shift;

    return $self->{'limit'};
}


=head2 reset_time_text

Getter for the reset_time_text attribute

=cut

sub reset_time_text {
    my $self = shift;

    return $self->{'reset_time_text'};
}

=head2 reset_time

Getter for the reset_time attribute

=cut

sub reset_time {
    my $self = shift;

    return $self->{'reset_time'};
}

=head2 namespace_limit

Getter for the namespace_limit attribute

=cut

sub namespace_limit {
    my $self = shift;

    return $self->{'namespace_limit'};
}

=head2 namespace_used

Getter for the namespace_used attribute

=cut

sub namespace_used {
    my $self = shift;

    return $self->{'namespace_used'};
}

=head2 namespace_remaining

Getter for the namespace_remaining attribute

=cut

sub namespace_remaining {
    my $self = shift;

    return $self->{'namespace_remaining'};
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

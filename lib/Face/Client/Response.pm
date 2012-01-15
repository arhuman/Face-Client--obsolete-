package Face::Client::Response;

use 5.006;
use strict;
use warnings;

=head1 NAME

Face::Client - The great new Face::Client!

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

The Face::Client::Response constructor

=cut

sub new {
    my $class  = shift;
    my %params = @_;

    my $self = {};

    for my $key ( keys %params ) {
        $self->{$key} = $params{$key};
    }

    return bless $self, $class;
}

=head2 status

Getter for the status attribute

=cut

sub status {
    my $self = shift;

    return $self->{'status'};
}

=head2 error_code

Getter for the error_code attribute

=cut

sub error_code {
    my $self = shift;

    return $self->{'error_code'};
}

=head2 error_message

Getter for the error_message attribute

=cut

sub error_message {
    my $self = shift;

    return $self->{'error_message'};
}

=head2 photos

Getter for the photos attribute

=cut

sub photos {
    my $self = shift;

    return $self->{'photos'};
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


=head2 tags

Getter for the tags attribute

=cut

sub tags {
    my $self = shift;

    return $self->{'tags'};
}


=head2 groups

Getter for the groups attribute

=cut

sub groups {
    my $self = shift;

    return $self->{'groups'};
}


=head2 tid

Getter for the tid attribute

=cut

sub tid {
    my $self = shift;

    return $self->{'tid'};
}


=head2 recognizable

Getter for the recognizable attribute

=cut

sub recognizable {
    my $self = shift;

    return $self->{'recognizable'};
}


=head2 threshold

Getter for the threshold attribute

=cut

sub threshold {
    my $self = shift;

    return $self->{'threshold'};
}


=head2 uids

Getter for the uids attribute

=cut

sub uids {
    my $self = shift;

    return $self->{'uids'};
}


=head2 label

Getter for the label attribute

=cut

sub label {
    my $self = shift;

    return $self->{'label'};
}


=head2 confirmed

Getter for the confirmed attribute

=cut

sub confirmed {
    my $self = shift;

    return $self->{'confirmed'};
}

=head2 manual

Getter for the manual attribute

=cut

sub manual {
    my $self = shift;

    return $self->{'manual'};
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

1; # End of Face::Client

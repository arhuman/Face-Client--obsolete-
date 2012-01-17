package Face::Client::Response::Tag;

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

=cut

sub new {
    my $class  = shift;
    my $params = shift;

    my $self = {};

    for my $key ( keys %$params ) {
        $self->{$key} = $params->{$key};
    }

    return bless($self, $class);
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

=head2 center

Getter for the center attribute

=cut

sub center {
    my $self = shift;

    return $self->{'center'};
}

=head2 eye_left

Getter for the eye_left attribute

=cut

sub eye_left {
    my $self = shift;

    return $self->{'eye_left'};
}

=head2 eye_right

Getter for the eye_right attribute

=cut

sub eye_right {
    my $self = shift;

    return $self->{'eye_right'};
}

=head2 mouth_left

Getter for the mouth_left attribute

=cut

sub mouth_left {
    my $self = shift;

    return $self->{'mouth_left'};
}

=head2 mouth_center

Getter for the mouth_center attribute

=cut

sub mouth_center {
    my $self = shift;

    return $self->{'mouth_center'};
}

=head2 mouth_right

Getter for the mouth_right attribute

=cut

sub mouth_right {
    my $self = shift;

    return $self->{'mouth_right'};
}

=head2 nose

Getter for the nose attribute

=cut

sub nose {
    my $self = shift;

    return $self->{'nose'};
}

=head2 yaw

Getter for the yaw attribute

=cut

sub yaw {
    my $self = shift;

    return $self->{'yaw'};
}


=head2 pitch

Getter for the pitch attribute

=cut

sub pitch {
    my $self = shift;

    return $self->{'pitch'};
}


=head2 roll

Getter for the roll attribute

=cut

sub roll {
    my $self = shift;

    return $self->{'roll'};
}


=head2 attributes

Getter for the attributes attribute

=cut

sub attributes {
    my $self = shift;

    return $self->{'attributes'};
}


=head2 gender

Getter for the gender attribute

=cut

sub gender {
    my $self = shift;

    return $self->{'gender'};
}


=head2 glasses

Getter for the glasses attribute

=cut

sub glasses {
    my $self = shift;

    return $self->{'glasses'};
}


=head2 smiling

Getter for the smiling attribute

=cut

sub smiling {
    my $self = shift;

    return $self->{'smiling'};
}



=head2 tid

Getter for the tid attribute

=cut

sub tid {
    my $self = shift;

    return $self->{'tid'};
}


=head2 mood

Getter for the mood attribute

=cut

sub mood {
    my $self = shift;

    return $self->{'mood'};
}


=head2 lips

Getter for the lips attribute

=cut

sub lips {
    my $self = shift;

    return $self->{'lips'};
}


=head2 face

Getter for the face attribute

=cut

sub face {
    my $self = shift;

    return $self->{'face'};
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

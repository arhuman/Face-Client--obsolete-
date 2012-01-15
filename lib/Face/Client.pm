package Face::Client;

use 5.006;
use strict;
use warnings;
use Carp;

use Face::Client::Response;
use Face::Client::Response::Tag;
use JSON;
use REST::Client;

=head1 NAME

Face::Client - Client to the Face.com REST API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0_01';

=head1 SYNOPSIS

Face::Client encapsulates Face.com REST API.

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

    my $self = bless {}, $class;
    $self->{server}     = 'http://api.face.com';
    $self->{api_key}    = $ENV{'FACE_API_KEY'};
    $self->{api_secret} = $ENV{'FACE_API_SECRET'};

    for my $key ( keys %$params ) {
        if ( $key =~ /^api_key$/i ) {
            $self->{'api_key'} = $params->{$key};
            next;
        }
        if ( $key =~ /^api_secret$/i ) {
            $self->{'api_secret'} = $params->{$key};
            next;
        }
        carp("Unknown parameter $key");
        return undef;
    }

    die "No API credentials provided"
      unless $self->{api_key} and $self->{api_secret};

    $self->{rest} = REST::Client->new();

    # Automatically follow redirect
    $self->{rest}->setFollow(1);
    $self->{rest}->setHost( $self->{server} );

    #        $self->set_header(Authorization => "Basic $creds");
    #        $self->set_header(Accept => "application/json");

    return $self;
}

=head2 faces_detect

=cut

sub faces_detect {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/faces/detect.json?" . $self->_get_url() . $parameters );
}

=head2 faces_train

=cut

sub faces_train {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/faces/train.json?" . $self->_get_url() . $parameters );
}

=head2 faces_recognize

=cut

sub faces_recognize {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/faces/recognize.json?" . $self->_get_url() . $parameters );
}

=head2 faces_status

=cut

sub faces_status {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/faces/status.json?" . $self->_get_url() . $parameters );
}

=head2 tags_add

=cut

sub tags_add {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/tags/add.json?" . $self->_get_url() . $parameters );
}

=head2 tags_remove

=cut

sub tags_remove {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/tags/remove.json?" . $self->_get_url() . $parameters );
}

=head2 tags_get

=cut

sub tags_get {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/tags/get.json?" . $self->_get_url() . $parameters );
}

=head2 tags_save

=cut

sub tags_save {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/tags/save.json?" . $self->_get_url() . $parameters );
}

=head2 account_limits

=cut

sub account_limits {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/accounts/limits.json?" . $self->_get_url() . $parameters );
}

=head2 account_users

=cut

sub account_users {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    return $self->_process_response( 'GET',
        "/tags/add.json?" . $self->_get_url() . $parameters );
}

=head2 _get_url

=cut

sub _get_url {
    my $self = shift;

    return
        "&api_key="
      . $self->{api_key}
      . "&api_secret="
      . $self->{api_secret};
}

=head2 _process_response

=cut

sub _process_response {
    my $self   = shift;
    my $method = shift;
    my $url    = shift;

    my @tags;

    if ( $method eq 'GET' ) {
        $self->{rest}->GET($url);
    }

    my $response = decode_json( $self->{rest}->responseContent );

    $self->{response} = Face::Client::Response->new(%$response);

    for my $tag ( @{ $response->{photos}[0]{tags} } ) {
        push @tags, Face::Client::Response::Tag->new($tag);

#        push @{$self->{ADEBUG}}, {X => Face::Client::Response::Tag->new($tag)};
    }

    @{ $self->{ADEBUG} } = @tags;
    return @tags;
}

=head2 response

=cut

sub response {
    my $self = shift;

    return $self->{response};
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

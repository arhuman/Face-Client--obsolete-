package Face::Client;

use 5.006;
use strict;
use warnings;
use Carp;

use Face::Client::Response;
use Face::Client::Response::Tag;
use JSON;
use REST::Client;

use Data::Dumper;

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

Returns tags for detected faces in one or more photos, with geometric information of the tag, eyes, nose and mouth, as well as various attributes such as gender, is wearing glasses, and is smiling.

Photos can also be uploaded directly in the API request. A requests that uploads a photo must be formed as a MIME multi-part message sent using POST data. Each argument, including the raw image data, should be specified as a separate chunk of form data.

More information : http://developers.face.com/docs/api/faces-detect/

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

Calls the training procedure for the specified UIDs, and reports back changes.

The training procedure uses information from previous tags.save calls to build a training set for the specified UIDs. For Facebook UIDs, you can skip the tags.save stage and call faces.train directly - we will use the passed credentials to create a training set from the users' tagged photos on Facebook.

More information : http://developers.face.com/docs/api/faces-train/

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

Attempts to detect and recognize one or more user IDs' faces, in one or more photos. For each detected face, the face.com engine will return the most likely user IDs, or empty result for unrecognized faces. In addition, each tag includes a threshold score - any score below this number is considered a low-probability hit.

You can also save the recognized faces by calling tags.save with the returned temporary tag id (tid), along with the relevant user ID. Saving tags is also the way to train the platform how users look like, for later calls to faces.recognize.

The first step in recognition is face detection, which is applied automatically for each photo sent for recognition. Therefor these calls generally use the same tag output with the addition of recognized user IDs (see faces.detect for more details and usage notes).

In addition, when passing specific uids, (not special list as "friends" and "all"), we will return a list of uids that have no train set, and there for cannot be recognized, under "no_training_set" list.

Photos can also be uploaded directly in the API request. A requests that uploads a photo must be formed as a MIME multi-part message sent using POST data. Each argument, including the raw image data, should be specified as a separate chunk of form data.

More information : http://developers.face.com/docs/api/faces-recognize/

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

Reports training set status for the specified UIDs.

This method only reports the status of the current training-set status, and does not change it. To improve, or create training set for a uid, use faces.train.

More information : http://developers.face.com/docs/api/faces-status/

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

Add a (manual) face tag to a photo. Use this method to add face tags where those were not detected for completeness of your service. Manual tags are treated like automatic tags, except they are not used to train the system how a user looks like. See the tags.save method to learn how to save automatic face tags for recognition purposes.

More information : http://developers.face.com/docs/api/tags-add/

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

Remove a previously saved face tag from a photo.

More information : http://developers.face.com/docs/api/tags-remove/

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

Returns saved tags in one or more photos, or for the specified User ID(s). This method also accepts multiple filters for finding tags corresponding to a more specific criteria such as front-facing, recent, or where two or more users appear together in same photos.

Photos can also be uploaded directly in the API request. A requests that uploads a photo must be formed as a MIME multi-part message sent using POST data. Each argument, including the raw image data, should be specified as a separate chunk of form data.

More information : http://developers.face.com/docs/api/tags-get/

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

Saves a face tag. Use this method to save tags for training the face.com index, or for future use of the faces.detect and tags.get methods.

This method accepts 2 primary parameters: User ID (uid) and a list of one or more Tag IDs (tids). The uid field represents a single user ID to associate with the saved tags with, while the tids is a list of tag ids previously acquired through calls to faces.detect or faces.recognize. When photos are processed through the detect and recognize methods, their response includes temporary tag IDs for use in subsequent tags.save calls. The temporary tag IDs are replaced with permanent tag IDs after calling the tags.save method, and are returned in the method's response for future reference.

More information : http://developers.face.com/docs/api/tags-save/

=cut

sub tags_save {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    $self->_process_response( 'GET', "/tags/save.json?" . $self->_get_url() . $parameters );

    return $self->response->saved_tags;
}

=head2 account_limits

Returns current rate limits for the account represented by the passed API key and Secret.

More information : http://developers.face.com/docs/api/account-limits/

=cut

sub account_limits {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    $self->_process_response( 'GET',
        "/account/limits.json?" . $self->_get_url() . $parameters );

    return $self->response->account;
}

=head2 account_users

Returns current users registered in the account's private namespaces. Users in a private namespace get registered implicitly through tags.save calls.

More information : http://developers.face.com/docs/api/account-users/

=cut

sub account_users {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    $self->_process_response( 'GET',
        "/account/users.json?" . $self->_get_url() . $parameters );

    return $self->response->account->users;
}

=head2 account_namespaces

Returns all authorized namespaces that given api_key can use with the API.

Authorized namespaces can be:

    Namespace owned by the owner of the api_key.
    Namespace defined as Public or Public Read only by other users
    Special Public Namespace: Facebook and Twitter

More information : http://developers.face.com/docs/api/account-namespaces/

=cut

sub account_namespaces {
    my $self   = shift;
    my %params = @_;

    my $parameters = '';

    for my $key ( keys %params ) {
        $parameters .= "&$key=" . $params{$key};
    }

    $self->_process_response( 'GET',
        "/account/namespaces.json?" . $self->_get_url() . $parameters );

    return $self->response->account->namespaces;
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

    if (ref $response !~ /^HASH/) {
        croak "Invalid response ($response)"
    }

    $self->{response} = Face::Client::Response->new($response);

    for my $photo ( $self->response->photos() ) {
        for my $tag ( $photo->tags() ) {
            push @tags, $tag;
        }
    }

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

=item * Github (report bugs here)

L<https://github.com/arhuman/Face-Client>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Face-Client>

=back

More information about Face.com service :

L<http://developers.face.com/docs/api>


=head1 ACKNOWLEDGEMENTS

Thanks to Face.com for the service they provide.
Thanks to Jaguar Network for allowing me to publish my work.

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Arnaud (Arhuman) ASSAD.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of Face::Client

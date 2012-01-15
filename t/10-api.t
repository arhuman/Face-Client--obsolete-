#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Face::Client;
use JSON;
use Data::Dumper;

plan tests => 29;

my $client;
eval {$client = Face::Client->new()};
ok(!$@,"new()");

isa_ok($client, 'Face::Client');

# Check for lowlevel API methods availability
can_ok ($client, "faces_detect");
my @tags = $client->faces_detect(urls => "http://face.com/img/faces-of-the-festival-no-countries.jpg");
#diag(Dumper($client->{response}));
diag("XXXXXXXXXXXXXXXXXXXXXXXXXXXX");
diag(Dumper(\@tags));
diag("YYYYYYYYYYYYYYYYYYYYYYYYYYYY");
for my $tag (@tags) {
    #diag(Dumper($tag));
    isa_ok($tag, 'Face::Client::Response::Tag');
    can_ok ($tag, "width");
    #diag($tag->width);
    can_ok ($tag, "height");
    #diag($tag->height);
    can_ok ($tag, "center");
    #diag($tag->center);
    can_ok ($tag, "eye_left");
    #diag($tag->eye_left);
    can_ok ($tag, "eye_right");
    #diag($tag->eye_right);
    can_ok ($tag, "mouth_left");
    #diag($tag->mouth_left);
    can_ok ($tag, "mouth_center");
    diag($tag->mouth_center);
    can_ok ($tag, "mouth_right");
    #diag($tag->mouth_right);
    can_ok ($tag, "nose");
    #diag($tag->nose);
    can_ok ($tag, "yaw");
    #diag($tag->yaw);
    can_ok ($tag, "pitch");
    #diag($tag->pitch);
    can_ok ($tag, "roll");
    #diag($tag->roll);
    can_ok ($tag, "attributes");
    #diag($tag->attributes);
    can_ok ($tag, "gender");
    diag($tag->gender);
    can_ok ($tag, "smiling");
    diag($tag->smiling);
    can_ok ($tag, "mood");
    diag($tag->modd);
    can_ok ($tag, "lips");
    diag($tag->lips);
    can_ok ($tag, "face");
    diag($tag->face);
}

my $response = $client->response;
isa_ok($response, 'Face::Client::Response');
can_ok ($response, "status");
#diag($response->status);
can_ok ($response, "error_code");
#diag($response->error_code);
can_ok ($response, "error_message");
#diag($response->error_message);
can_ok ($response, "photos");
#diag($response->photos);
can_ok ($response, "url");
#diag($response->url);
can_ok ($response, "pid");
#diag($response->pid);
can_ok ($response, "width");
diag($response->width);
can_ok ($response, "height");
#diag($response->height);
can_ok ($response, "tags");
#diag($response->responses);
can_ok ($response, "groups");
#diag($response->groups);
can_ok ($response, "tid");
#diag($response->tid);
can_ok ($response, "recognizable");
#diag($response->recognizable);
can_ok ($response, "threshold");
#diag($response->threshold);
can_ok ($response, "uids");
diag($response->uids);
can_ok ($response, "confirmed");
diag($response->confirmed);
can_ok ($response, "manual");
diag($response->manual);



can_ok ($client, "faces_recognize");
can_ok ($client, "faces_train");
can_ok ($client, "faces_status");

can_ok ($client, "tags_get");
can_ok ($client, "tags_add");
can_ok ($client, "tags_save");
can_ok ($client, "tags_remove");

can_ok ($client, "account_limits ");
can_ok ($client, "account_users ");


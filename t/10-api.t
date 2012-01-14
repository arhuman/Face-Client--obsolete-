#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Face::Client;

plan tests => 12;

my $client;
eval {$client = Face::Client->new()};
ok(!$@,"new()");

isa_ok($client, 'Face::Client');

# Check for lowlevel API methods availability
can_ok ($client, "faces_detect ");
my $response = $client->faces_detect(url => ""http://face.com/img/faces-of-the-festival-no-countries.jpg");
isa_ok($response, 'Face::Client::Response::Tag');
can_ok ($response, "status");
can_ok ($response, "error_code");
can_ok ($response, "error_message");
can_ok ($response, "photos");
can_ok ($response, "url");
can_ok ($response, "id");
can_ok ($response, "width");
can_ok ($response, "height");
can_ok ($response, "tags");
can_ok ($response, "groups");
can_ok ($response, "tid");
can_ok ($response, "recognizable");
can_ok ($response, "threshold");
can_ok ($response, "uids");
can_ok ($response, "confirmed");
can_ok ($response, "manual");



can_ok ($client, "faces_recognize");
can_ok ($client, "faces_train");
can_ok ($client, "faces_status");

can_ok ($client, "tags_get");
can_ok ($client, "tags_add");
can_ok ($client, "tags_save");
can_ok ($client, "tags_remove");

can_ok ($client, "account_limits ");
can_ok ($client, "account_users ");


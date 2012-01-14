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
can_ok ($client, "faces_recognize");
can_ok ($client, "faces_train");
can_ok ($client, "faces_status");

can_ok ($client, "tags_get");
can_ok ($client, "tags_add");
can_ok ($client, "tags_save");
can_ok ($client, "tags_remove");

can_ok ($client, "account_limits ");
can_ok ($client, "account_users ");


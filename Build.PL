use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Face::Client',
    license           => 'perl',
    dist_author       => q{Arnaud (Arhuman) ASSAD <arhuman@gmail.com>},
    dist_version_from => 'lib/Face/Client.pm',
    build_requires    => {
        'JSON'         => 0,
        'REST::Client' => 0,
        'Test::More'   => 0,
    },
    requires           => { 'perl' => 5.006, },
    add_to_cleanup     => ['Face-Client-*'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();

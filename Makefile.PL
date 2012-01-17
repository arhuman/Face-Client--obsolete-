use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Face::Client',
    AUTHOR        => q{Arnaud (Arhuman) ASSAD <arhuman@gmail.com>},
    VERSION_FROM  => 'lib/Face/Client.pm',
    ABSTRACT_FROM => 'lib/Face/Client.pm',
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'JSON'         => 0,
        'REST::Client' => 0,
        'Test::More' => 0,
    },
    dist                => { COMPRESS => ' gzip - 9 f ', SUFFIX => ' gz ', },
    clean               => { FILES => 'Face-Client-*'
    },
);

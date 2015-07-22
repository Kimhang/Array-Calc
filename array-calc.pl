#!/usr/bin/env perl

use strict;
use warnings;
use Data::Rand;
use lib '../Array-Calc/lib';
use Array::Calc qw/make_rand_arr calc_consecutive_words print_arr/;
use Data::Printer;

sub main {
    my $num = 30;
    my @data = ( 'AAA', 'BBB' );

    my $arr1 = make_rand_arr( $num, \@data );
    my $arr2 = make_rand_arr( $num, \@data );

    print_arr( $num, $arr1, $arr2 );

    my ( $longest_a, $longest_b, $stotal, $ntotal ) = calc_consecutive_words( $num, $arr1, $arr2, \@data );

    print "같은경우: $stotal\n다른경우: $ntotal\n";
    print "A: $longest_a, B: $longest_b\n";
}

main();

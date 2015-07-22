use strict;
use Test::More 0.98;
use Test::Ika;
use utf8;
use Array::Calc qw( make_rand_arr calc_consecutive_words );
use Data::Printer;

my $num = 30;
my @data = ( 'AAA', 'BBB' );

describe 'Array::Calc' => sub {
    it 'Array::Calc 모듈이 로딩되는가?' => sub {
        use_ok $_ for qw(Array::Calc);
    };
    it 'make_rand_arr 인자가 없는 경우' => sub {
         ok !make_rand_arr();
    };
    it 'calc_consecutive_words 인자가 없는 경우' => sub {
        ok !calc_consecutive_words();
    };
    it 'make_rand_arr에 인자가 없고, calc_consecutive_words는 인자가 있는 경우' => sub {
        my $arr1 = make_rand_arr();
        my $arr2 = make_rand_arr();
        ok !calc_consecutive_words($num, $arr1, $arr2, \@data);
    };
    it 'make_rand_arr 제대로 동작하는가?' => sub {
        ok make_rand_arr( $num, @data );
    };
    it 'calc_consecutive_words 제대로 동작하는가?' => sub {
        my $arr3 = make_rand_arr( $num, \@data );
        my $arr4 = make_rand_arr( $num, \@data );
        ok calc_consecutive_words( $num, $arr3, $arr4, \@data );
    };
}

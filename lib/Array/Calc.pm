package Array::Calc;

use utf8;
use strict;
use warnings;
use base qw(Exporter);
use Data::Rand;
use Data::Printer;

our @EXPORT = qw( make_rand_arr calc_consecutive_words print_arr );

sub make_rand_arr {
    my ( $num, @data ) = @_;

    if ( !$num or !@data ) {
        return;
    }

    my @arr = rand_data( $num, @data );

    return \@arr;
}

sub print_arr {
    my ( $num, $arr1, $arr2 ) = @_;

    if ( !$num or !$arr1 or !$arr2 ) {
        return 0;
    }

    for my $n ( 0 .. $num-1 ) {
        print "$n. @$arr1[$n]\t@$arr2[$n]\n";
    }
}

sub calc_consecutive_words {
    my ( $num, $arr1, $arr2, $data ) = @_;

    if ( !$num or !$arr1 or !$arr2 or !$data ) {
        return ( 0, 0, 0, 0 );
    }

    my ( $count, $scount, $ncount, $stotal, $ntotal, $longest_a, $longest_b, $lastword, $status ) = ( 0, 0, 0, 0, 0, 0, 0, '', 0 );

    for my $i ( 0 .. $num-1 ) {
        if ( @$arr1[$i] eq @$arr2[$i] ) {
            diff_total_in_progress( \$ntotal, \$ncount );

            if ( $status == 0 or $lastword ne @$arr1[$i] ) {
                same_each_in_progress( $lastword, \$longest_a, \$longest_b, \$count, $data );
            }
            $count++;
            $lastword = @$arr1[$i];

            $scount++;
            $status = 1;
        }
        else {
            same_total_in_progress( \$stotal, \$scount );

            $ncount++;
            $status = 0;
        }
    }

    check_fin( $lastword, \$longest_a, \$longest_b, \$stotal, \$ntotal, $scount, $ncount, $count, $data );

    return ( $longest_a, $longest_b, $stotal, $ntotal );
}

sub same_each_in_progress {
    my ( $lastword, $longest_a, $longest_b, $count, $data ) = @_;

    if ( $lastword eq @$data[0] and $$count > $$longest_a ) {
        $$longest_a = $$count;
    } elsif ( $lastword eq @$data[1] and $$count > $$longest_b ) {
        $$longest_b = $$count;
    }
    $$count = 0;
}

sub same_total_in_progress {
    my ( $stotal, $scount ) = @_;

    if ( $$stotal < $$scount ) {
        $$stotal = $$scount;
    }

    $$scount = 0;
}

sub diff_total_in_progress {
    my ( $ntotal, $ncount ) = @_;

    if ( $$ntotal < $$ncount ) {
        $$ntotal = $$ncount;
    }

    $$ncount = 0;
}

sub check_fin {
    my ( $lastword, $longest_a, $longest_b, $stotal, $ntotal, $scount, $ncount, $count, $data ) = @_;

    if ( $lastword eq @$data[0] and $$longest_a < $count ) {
        $$longest_a = $count;
    } elsif ( $lastword eq @$data[1] and $$longest_b < $count ) {
        $$longest_b = $count;
    }

    if ( $$stotal < $scount ) {
        $$stotal = $scount;
    } elsif ( $$ntotal < $ncount ) {
        $$ntotal = $ncount;
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

Array::Calc - It's new $module

=head1 SYNOPSIS

    use Array::Calc;

    my $array1 = make_rand_arr( $num, \@data );
    my $array2 = make_rand_arr( $num, \@data );

    my ( $longest_a, $longest_b, $same_total, $not_same_total ) = calc_consecutive_words( $num, $array1, $array2, \@data );

=head1 DESCRIPTION

Array::Calc is ...
두 배열에서 서로 같은 요소의 최다 연속출연횟수를 계산하는 모듈입니다.
1. 두 요소, A와 B 각각의 최다 연속출연횟수
2. 서로 같은 요소의 최다 연속출연횟수
3. 서로 같지 않은 요소의 최다 연속출연횟수

=head1 LICENSE

Copyright (C) hang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

hang E<lt>hang@shou.krE<gt>

=cut


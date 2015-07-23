# NAME

Array::Calc - It's new $module

# SYNOPSIS

    use Array::Calc;

    my $array1 = make_rand_arr( $num, \@data );
    my $array2 = make_rand_arr( $num, \@data );

    my ( $longest_a, $longest_b, $same_total, $not_same_total ) = calc_consecutive_words( $num, $array1, $array2, \@data );

# DESCRIPTION

Array::Calc is ...

두 배열에서 서로 같은 요소의 최다 연속출연횟수를 계산하는 모듈입니다.

1\. 두 요소, A와 B 각각의 최다 연속출연횟수

2\. 서로 같은 요소의 최다 연속출연횟수

3\. 서로 같지 않은 요소의 최다 연속출연횟수

# LICENSE

Copyright (C) hang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

hang <hang@shou.kr>

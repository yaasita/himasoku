#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

for ( 10000000..99999999 ){
    my $dividend = $_;
    for ( 100..999 ){
        my $divisor = $_;
        next if $dividend % $divisor != 0;
        my $quotient = $dividend / $divisor;
        next if $quotient !~ /^\d7\d0\d$/;

        my $stage_1 = substr($quotient,0,1) * $divisor;
        next unless length($stage_1) == 4;

        my $stage_2 = substr($dividend,0,4) - $stage_1;
        $stage_2 .= substr($dividend,4,1);
        next unless length($stage_2) == 3;

        my $stage_3 = $divisor * 7;
        next unless length($stage_3) == 3;

        my $stage_4 = $stage_2 - $stage_3;
        $stage_4 .= substr($dividend,5,1);
        next unless length($stage_4) == 4;

        my $stage_5 = $divisor * substr($quotient,2,1);
        next unless length($stage_5) == 3;

        my $stage_6 = $stage_4 - $stage_5;
        $stage_6 .= substr($dividend,6,2);
        next unless length($stage_6) == 4;
        # ex 11061005 / 113 = 97885

        my $stage_7 = $divisor * substr($quotient,4,1);
        next unless length($stage_7) == 4;
        
        next unless $stage_6 == $stage_7;

        say "$dividend / $divisor = $quotient";
        exit;
    }
    say $dividend if $dividend % 100000 == 0;
}

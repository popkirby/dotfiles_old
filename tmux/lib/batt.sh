#!/bin/sh

/usr/bin/pmset -g ps \
  | tail -1 \
  | perl -CS -ane '
    BEGIN {
      @ticks = map { chr 0x2580 + $_ } 1 .. 8;
    }

    my $bcolor, $bcolor2;
    my $bperc = $F[1] / 100;
    my $bicon;

    if ($F[2] eq "charging;") {
      $bcolor = "green";
    } else {
      $bcolor = "yellow";
    }

    if ($bperc < 0.33) {
      $bcolor2 = "red";
    } elsif ($bperc < 0.66) {
      $bcolor2 = "yellow";
    } else {
      $bcolor2 = "green";
    }
    
    $bicon =  $ticks[$bperc * $#ticks];

    print "#[fg=$bcolor]|#[fg=$bcolor2]$bicon $F[3]";
  '

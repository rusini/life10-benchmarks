# life.pl -- Conway's Game of Life in Perl (version 5)

($n, $m) = (40, 80);
$g = 1000;

sub display {
   my @b = @_;
   for (my $i = 0; $i < $n; $i++) {
      for (my $j = 0; $j < $m; $j++) {
         print $b[$i][$j] ? '*' : ' '
      }
      print "\n"
   }
}

sub main {
   my @b;
   for (my $i = 0; $i < $n; $i++) {
      for (my $i = 0; $i < $n; $i++) {
         $b[$i][$j] = 0
      }
   }
   # initialization
   $b[19][41] = 1;
   $b[20][40] = 1;
   $b[21][40] = 1;
   $b[22][40] = 1;
   $b[22][41] = 1;
   $b[22][42] = 1;
   $b[22][43] = 1;
   $b[19][44] = 1;
   # end of initialization
   print "Before:\n"; display @b;

   my @nextb;
   my ($nm1, $mm1) = ($n - 1, $m - 1);
   for (my $k = 0; $k < $g; $k++) {
      for (my $i = 0; $i < $n; $i++) {
         my $up = $i != 0 ? $i - 1 : $nm1; my $down = $i != $nm1 ? $i + 1 : 0;
         for (my $j = 0; $j < $m; $j++) {
            my $left = $j != 0 ? $j - 1 : $mm1; my $right = $j != $mm1 ? $j + 1 : 0;
            my $count =
               $b[$up  ][$left ] +
               $b[$up  ][$j    ] +
               $b[$up  ][$right] +
               $b[$i   ][$right] +
               $b[$down][$right] +
               $b[$down][$j    ] +
               $b[$down][$left ] +
               $b[$i   ][$left ];
            $nextb[$i][$j] = $count == 2 && $b[$i][$j] || $count == 3
         }
      }
      { my @tmp = @b; @b = @nextb; @nextb = @tmp }
   }
   print "After $g generations:\n"; display @b
}
main;

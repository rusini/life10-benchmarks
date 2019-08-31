<?php // life.php -- Conway's Game of Life in PHP

$n = 40; $m = 80;
$g = 1000;

function display($b) {
   global $n, $m;
   for ($i = 0; $i < $n; $i++) {
      for ($j = 0; $j < $m; $j++) echo $b[$i][$j] ? '*' : ' ';
      echo "\n";
   }
}

function main() {
   global $n, $m, $g;

   for ($i = 0; $i < $n; $i++)
   for ($j = 0; $j < $m; $j++)
      $b[$i][$j] = 0;
   // initialization
   $b[19][41] = 1;
   $b[20][40] = 1;
   $b[21][40] = 1;
   $b[22][40] = 1;
   $b[22][41] = 1;
   $b[22][42] = 1;
   $b[22][43] = 1;
   $b[19][44] = 1;
   // end of initialization
   echo "Before:\n"; display($b);

   $nm1 = $n - 1; $mm1 = $m - 1;
   for ($k = 0; $k < $g; $k++) {
      for ($i = 0; $i < $n; $i++) {
         $up = $i != 0 ? $i - 1 : $nm1; $down = $i != $nm1 ? $i + 1 : 0;
         for ($j = 0; $j < $m; $j++) {
            $left = $j != 0 ? $j - 1 : $mm1; $right = $j != $mm1 ? $j + 1 : 0;
            $count =
               $b[$up  ][$left ] +
               $b[$up  ][$j    ] +
               $b[$up  ][$right] +
               $b[$i   ][$right] +
               $b[$down][$right] +
               $b[$down][$j    ] +
               $b[$down][$left ] +
               $b[$i   ][$left ];
            $nextb[$i][$j] = $count == 2 && $b[$i][$j] || $count == 3;
         }
      }
      $b = $nextb;
   }
   echo "After $g generations:\n"; display($b);
}
main();

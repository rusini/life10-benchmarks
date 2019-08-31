# life.tcl -- Conway's Game of Life in Tcl

set n 40; set m 80
set g 100

proc display {} {
   global n m b
   for {set i 0} {$i < $n} {incr i} {
      for {set j 0} {$j < $m} {incr j} {
         if {$b($i,$j)} {puts -nonewline {*}} else {puts -nonewline { }}
      }
      puts {}
   }
}

proc main {} {
   global n m b g

   for {set i 0} {$i < $n} {incr i} {for {set j 0} {$j < $m} {incr j} {set b($i,$j) 0}}
   # initialization
   set b(19,41) 1
   set b(20,40) 1
   set b(21,40) 1
   set b(22,40) 1
   set b(22,41) 1
   set b(22,42) 1
   set b(22,43) 1
   set b(19,44) 1
   # end of initialization
   puts "Before:"; display

   set nm1 [expr $n - 1]
   set mm1 [expr $m - 1]
   for {set k 0} {$k < $g} {incr k} {
      for {set i 0} {$i < $n} {incr i} {
         set up   [expr $i != 0 ? $i - 1 : $nm1]
         set down [expr $i != $nm1 ? $i + 1 : 0]
         for {set j 0} {$j < $m} {incr j} {
            set left  [expr $j != 0 ? $j - 1 : $mm1]
            set right [expr $j != $mm1 ? $j + 1 : 0]
            set count [expr       \
               $b($up,$left)    + \
               $b($up,$j)       + \
               $b($up,$right)   + \
               $b($i,$right)    + \
               $b($down,$right) + \
               $b($down,$j)     + \
               $b($down,$left)  + \
               $b($i,$left)]
            set nextb($i,$j) [expr $count == 2 && $b($i,$j) || $count == 3]
         }
      }
      for {set i 0} {$i < $n} {incr i} {for {set j 0} {$j < $m} {incr j} {set b($i,$j) $nextb($i,$j)}}
   }
   puts "After $g generations:"; display
}
main

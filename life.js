// life.js -- Conway's Game of Life in JavaScript/ECMAScript (Node.js)

n = 40, m = 80;
g = 66000;

function display(b) {
   for (var i = 0; i < n; i++) {
      for (var j = 0; j < m; j++) process.stdout.write(b[i][j] ? '*' : ' ');
      process.stdout.write('\n');
   }
}

function main() {
   var b = new Array(n);
   for (var i = 0; i < n; i++) {
      b[i] = new Array(m);
      for (var j = 0; j < m; j++) b[i][j] = 0;
   }
   // initialization
   b[19][41] = 1;
   b[20][40] = 1;
   b[21][40] = 1;
   b[22][40] = 1;
   b[22][41] = 1;
   b[22][42] = 1;
   b[22][43] = 1;
   b[19][44] = 1;
   // end of initialization
   process.stdout.write('Before:\n'); display(b);

   var nextb = new Array(n);
   for (var i = 0; i < n; i++) nextb[i] = new Array(m);
   var nm1 = n - 1, mm1 = m - 1;
   for (var k = 0; k < g; k++) {
      for (var i = 0; i < n; i++) {
         var up = i != 0 ? i - 1 : nm1, down = i != nm1 ? i + 1 : 0;
         for (var j = 0; j < m; j++) {
            var left = j != 0 ? j - 1 : mm1, right = j != mm1 ? j + 1 : 0;
            var count =
               b[up  ][left ] +
               b[up  ][j    ] +
               b[up  ][right] +
               b[i   ][right] +
               b[down][right] +
               b[down][j    ] +
               b[down][left ] +
               b[i   ][left ];
            nextb[i][j] = count == 2 ? b[i][j] : count == 3 ? 1 : 0;
         }
      }
      var tmp = b; b = nextb; nextb = tmp;
   }
   process.stdout.write('After ' + g + ' generations:\n'); display(b);
}
main();

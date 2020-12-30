// life2.java -- Conway's Game of Life in Java (version 8 and later)
// facilitate bounds checking elimination

class Main {
   private static final int n = 40, m = 80;
   private static final int g = 66000;

   private static void display(byte[][] b) {
      for (int i = 0; i < n; i++) {
         for (int j = 0; j < m; j++) System.out.print(b[i][j] != 0 ? '*' : ' ');
         System.out.println();
      }
   }

   public static void main(String[] args) {
      byte[][] b = new byte[n][m];
      // initialization
      b[19][41] =
      b[20][40] =
      b[21][40] =
      b[22][40] =
      b[22][41] =
      b[22][42] =
      b[22][43] =
      b[19][44] = 1;
      // end of initialization
      System.out.println("Before:"); display(b);

      byte[][] nextb = new byte[n][m];
      for (int k = 0; k < g; k++) {
         for (int i = 0; i < b.length; i++) {
            int up = i != 0 ? i - 1 : b.length - 1, down = i != b.length - 1 ? i + 1 : 0;
            for (int m = b[i].length, j = 0; j < b[i].length; j++) {
               int left = j != 0 ? j - 1 : b[i].length - 1, right = j != b[i].length - 1 ? j + 1 : 0;
               int count =
                  b[up  ][left ] +
                  b[up  ][j    ] +
                  b[up  ][right] +
                  b[i   ][right] +
                  b[down][right] +
                  b[down][j    ] +
                  b[down][left ] +
                  b[i   ][left ];
               nextb[i][j] = count == 2 ? b[i][j] : count == 3 ? (byte)1 : (byte)0;
            }
         }
         byte[][] tmp = b; b = nextb; nextb = tmp;
      }
      System.out.println("After " + g + " generations:"); display(b);
   }
}

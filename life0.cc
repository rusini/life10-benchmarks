// life0.cc -- Conway's Game of Life in C++ (version 2011 and later)
// no array bounds checking

# include <cstring>
# include <iostream>

constexpr int n = 40, m = 80;
constexpr int g = 66000;

static void display(signed char b[n][m]) noexcept {
   for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) std::cout << (b[i][j] ? '*' : ' ');
      std::cout << '\n';
   }
}

int main() {
   signed char b[n][m]{};
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
   std::cout << "Before:\n"; display(b);

   decltype(b) nextb;
   for (int k = 0; k < g; ++k) {
      for (int i = 0; i < n; ++i) {
         constexpr int nm1 = n - 1;
         int up = i != 0 ? i - 1 : nm1, down = i != nm1 ? i + 1 : 0;
         for (int j = 0; j < m; ++j) {
            constexpr int mm1 = m - 1;
            int left = j != 0 ? j - 1 : mm1, right = j != mm1 ? j + 1 : 0;
            int count =
               b[up  ][left ] +
               b[up  ][j    ] +
               b[up  ][right] +
               b[i   ][right] +
               b[down][right] +
               b[down][j    ] +
               b[down][left ] +
               b[i   ][left ];
            nextb[i][j] = count == 2 && b[i][j] || count == 3;
         }
      }
      std::memcpy(b, nextb, sizeof b);
   }
   std::cout << "After " << g << " generations:\n"; display(b);
   return {};
}

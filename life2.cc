// life2.cc -- Conway's Game of Life in C++ (version 2011 and later)
// facilitate bounds checking elimination

# include <vector>
# include <iostream>

constexpr int n = 40, m = 80;
constexpr int g = 66000;

static void display(const std::vector<std::vector<signed char>> &b) noexcept {
   for (int i = 0; i < n; ++i) {
      for (int j = 0; j < m; ++j) std::cout << (b.at(i).at(j) ? '*' : ' ');
      std::cout << '\n';
   }
}

int main() {
   auto b = std::vector<std::vector<signed char>>(n, std::vector<signed char>(m));
   // initialization
   b.at(19).at(41) =
   b.at(20).at(40) =
   b.at(21).at(40) =
   b.at(22).at(40) =
   b.at(22).at(41) =
   b.at(22).at(42) =
   b.at(22).at(43) =
   b.at(19).at(44) = 1;
   // end of initialization
   std::cout << "Before:\n"; display(b);

   auto nextb = std::vector<std::vector<signed char>>(n, std::vector<signed char>(m));
   for (int k = 0; k < g; ++k) {
      for (decltype(b.size()) i = 0; i < b.size(); ++i) {
         auto up = i != 0 ? i - 1 : b.size() - 1, down = i != b.size() - 1 ? i + 1 : 0;
         for (decltype(b.at(i).size()) j = 0; j < b.at(i).size(); ++j) {
            auto left = j != 0 ? j - 1 : b.at(i).size() - 1, right = j != b.at(i).size() - 1 ? j + 1 : 0;
            int count =
               b.at(up  ).at(left ) +
               b.at(up  ).at(j    ) +
               b.at(up  ).at(right) +
               b.at(i   ).at(right) +
               b.at(down).at(right) +
               b.at(down).at(j    ) +
               b.at(down).at(left ) +
               b.at(i   ).at(left );
            nextb.at(i).at(j) = count == 2 && b.at(i).at(j) || count == 3;
         }
      }
      b.swap(nextb);
   }
   std::cout << "After " << g << " generations:\n"; display(b);
   return {};
}

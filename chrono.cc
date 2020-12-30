// chrono.cc

# include <cstdlib>
# include <cstdio>
# include <time.h>

int main() {
   const auto echo = []()noexcept{
      auto ch = std::getchar();
      if (ch == EOF) if (std::feof(stdin)) return EOF; else std::perror("Cannot getchar"), std::exit(EXIT_FAILURE);
      if (std::putchar(ch) == EOF) std::perror("Cannot putchar"), std::exit(EXIT_FAILURE);
      return ch;
   };
   static constexpr auto clk_id =
# if defined CLOCK_MONOTONIC_RAW
   CLOCK_MONOTONIC_RAW // e.g. Linux
# elif defined CLOCK_MONOTONIC_PRECISE
   CLOCK_MONOTONIC_PRECISE // e.g. FreeBSD
# else
   # error "Either CLOCK_MONOTONIC_RAW or CLOCK_MONOTONIC_PRECISE is required"
# endif
   ;
   struct ::timespec ts;
   for (int ch;;) {
      ::clock_gettime(clk_id, &ts);
      if ( (ch = echo()) == 'A' &&
           (ch = echo()) == 'f' &&
           (ch = echo()) == 't' &&
           (ch = echo()) == 'e' &&
           (ch = echo()) == 'r' &&
           (ch = echo()) == ' ' ) break;
      for (; ch != '\n'; ch = echo()) if (ch == EOF)
         std::fputs("Unexpected EOF\n", stderr), std::exit(EXIT_FAILURE);
   }
   struct ::timespec ts2;
   ::clock_gettime(clk_id, &ts2);
   while (echo() != EOF);
   if (ts2.tv_nsec < ts.tv_nsec) --ts2.tv_sec, ts2.tv_nsec += 1000000000;
   ts2.tv_sec -= ts.tv_sec, ts2.tv_nsec -= ts.tv_nsec;
   std::fprintf(stderr, "Elapsed time: %llu.%06lds\n", (unsigned long long)ts2.tv_sec, (ts2.tv_nsec + 500) / 1000);
   return EXIT_SUCCESS;
}

# life.rb -- Conway's Game of Life in Ruby

N, M = 40, 80
G = 1000

def display(b)
  for i in 0 .. N - 1
    for j in 0 .. M - 1
      print b[i][j] != 0 ? '*' : ' '
    end
    puts
  end
end

def main()
  b = Array.new(N) {Array.new(M, 0)}
  # initialization
  b[19][41] = 1
  b[20][40] = 1
  b[21][40] = 1
  b[22][40] = 1
  b[22][41] = 1
  b[22][42] = 1
  b[22][43] = 1
  b[19][44] = 1
  # end of initialization
  puts "Before:"; display b

  nextb = Array.new(N) {Array.new(M, 0)}
  nm1, mm1 = N - 1, M - 1
  for k in 1 .. G
    for i in 0 .. nm1
      up = i != 0 ? i - 1 : nm1; down = i != nm1 ? i + 1 : 0
      for j in 0 .. mm1
        left = j != 0 ? j - 1 : mm1; right = j != mm1 ? j + 1 : 0
        count =
          b[up  ][left ] +
          b[up  ][j    ] +
          b[up  ][right] +
          b[i   ][right] +
          b[down][right] +
          b[down][j    ] +
          b[down][left ] +
          b[i   ][left ]
        nextb[i][j] = count == 2 ? b[i][j] : count == 3 ? 1 : 0;
      end
    end
    b, nextb = nextb, b
  end
  puts "After #{G} generations:"; display b
end
main

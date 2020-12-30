# life.jl -- Conway's Game of Life in Julia

const n, m = 40, 80
const g = 66000

function display(b)
  for i = 1:n
    for j = 1:m
      print(b[i, j] != 0 ? '*' : ' ')
    end
    println()
  end
end

function main()
  local b = zeros(Int8, (n, m))
  # initialization
  b[20, 42] =
  b[21, 41] =
  b[22, 41] =
  b[23, 41] =
  b[23, 42] =
  b[23, 43] =
  b[23, 44] =
  b[20, 45] = 1
  # end of initialization
  println("Before:"); display(b)

  local nextb = Array{Int8, 2}(undef, n, m)
  for k = 1:g
    for i = 1:n
      local up, down = i != 1 ? i - 1 : n, i != n ? i + 1 : 1
      for j = 1:m
        local left, right = j != 1 ? j - 1 : m, j != m ? j + 1 : 1
        local count =
          b[up,   left ] +
          b[up,   j    ] +
          b[up,   right] +
          b[i,    right] +
          b[down, right] +
          b[down, j    ] +
          b[down, left ] +
          b[i,    left ]
        nextb[i, j] = count == 2 ? b[i, j] : count == 3 ? 1 : 0
      end
    end
    b, nextb = nextb, b
  end
  println("After ", g, " generations:"); display(b)
end
main()

-- life.lua -- Conway's Game of Life in Lua

n, m = 40, 80
g = 66000

function display(b)
  for i = 0, n - 1 do
    for j = 0, m - 1 do
      if b[i][j] ~= 0 then io.write("*") else io.write(" ") end
    end
    io.write("\n")
  end
end

function main()
  local b = {}
  for i = 0, n - 1 do
    b[i] = {}
    for j = 0, m - 1 do
      b[i][j] = 0
    end
  end
  -- initialization
  b[19][41] = 1
  b[20][40] = 1
  b[21][40] = 1
  b[22][40] = 1
  b[22][41] = 1
  b[22][42] = 1
  b[22][43] = 1
  b[19][44] = 1
  -- end of initialization
  io.write("Before:\n"); display(b)

  local nextb = {}
  for i = 0, n - 1 do
    nextb[i] = {}
  end
  local nm1, mm1 = n - 1, m - 1
  for k = 1, g do
    for i = 0, nm1 do
      local up, down
      if i ~= 0 then up = i - 1 else up = nm1 end
      if i ~= nm1 then down = i + 1 else down = 0 end
      for j = 0, mm1 do
        local left, right
        if j ~= 0 then left = j - 1 else left = mm1 end
        if j ~= mm1 then right = j + 1 else right = 0 end
        local count =
          b[up  ][left ] +
          b[up  ][j    ] +
          b[up  ][right] +
          b[i   ][right] +
          b[down][right] +
          b[down][j    ] +
          b[down][left ] +
          b[i   ][left ]
        if count == 2 then nextb[i][j] = b[i][j]
        elseif count == 3 then nextb[i][j] = 1
        else nextb[i][j] = 0
        end
      end
    end
    b, nextb = nextb, b
  end
  io.write("After ", g, " generations:\n"); display(b)
end
main()

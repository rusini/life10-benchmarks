# life.py3 -- Conway's Game of Life in Python (version 3)

from sys import stdout

n, m = 40, 80
g = 1000

def display(b):
  for i in range(n):
    for j in range(m):
       stdout.write("*" if b[i][j] else " ")
    print()

def main():
  b = [[0 for j in range(m)] for i in range(n)]
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
  print("Before:"); display(b)

  nextb = [[0 for j in range(m)] for i in range(n)]
  nm1, mm1 = n - 1, m - 1
  for k in range(g):
    for i in range(n):
      up = i - 1 if i != 0 else nm1; down = i + 1 if i != nm1 else 0
      for j in range(m):
        left = j - 1 if j != 0 else mm1; right = j + 1 if j != mm1 else 0
        count = (
          b[up  ][left ] +
          b[up  ][j    ] +
          b[up  ][right] +
          b[i   ][right] +
          b[down][right] +
          b[down][j    ] +
          b[down][left ] +
          b[i   ][left ] )
        nextb[i][j] = b[i][j] if count == 2 else 1 if count == 3 else 0
    b, nextb = nextb, b
  print("After", g, "generations:"); display(b)

main()

import sys

arg = sys.argv[1:]
inputs = open(f"../input/01{arg and arg[0] or ''}.input").read().splitlines()

cur_pos = 50
points = 0

for turn in inputs:
    dir_letter = turn[0]
    amount = int(turn[1:])
    if dir_letter == 'L':
        cur_pos -= amount
    elif dir_letter == 'R':
        cur_pos += amount
    _, cur_pos = divmod(cur_pos, 100)
    if cur_pos == 0:
        points += 1

print(points)

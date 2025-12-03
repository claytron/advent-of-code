import sys

arg = sys.argv[1:]
inputs = open(f"../input/01{arg and arg[0] or ''}.input").read().splitlines()

cur_pos = 50
points = 0

for turn in inputs:
    dir_letter = turn[0]
    distance = int(turn[1:])

    # Count how many times we pass through 0 during this rotation
    if dir_letter == 'R':
        points += (cur_pos + distance) // 100
        cur_pos = (cur_pos + distance) % 100
    elif dir_letter == 'L':
        if cur_pos == 0:
            points += distance // 100
        elif distance >= cur_pos:
            points += 1 + (distance - cur_pos) // 100
        cur_pos = (cur_pos - distance) % 100

print(points)

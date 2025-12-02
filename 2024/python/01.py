inputs = open("../input/01.input").read().splitlines()

import pdb; pdb.set_trace()
pairs = [
    [int(i) for i in i.split()]
    for i in inputs
]

columns = list(map(list, zip(*pairs)))
sorted_pairs = list(zip(sorted(columns[0]), sorted(columns[1])))

total = 0
for pair in sorted_pairs:
    total += abs(pair[0] - pair[1])

print(total)

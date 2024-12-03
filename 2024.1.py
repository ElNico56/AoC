# AoC 2024 Day 1 #

with open("2024.1.in", "r") as file:
    data = file.read()

lines = data.splitlines()

L = [int(line.split()[0]) for line in lines]
R = [int(line.split()[1]) for line in lines]

L.sort()
R.sort()

p1 = sum(abs(l - r) for l, r in zip(L, R))

p2 = sum(v * R.count(v) for v in L)

print(f"A: {p1}")
print(f"B: {p2}")

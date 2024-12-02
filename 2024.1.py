# AoC 2024 Day 1 #

with open("2024.1.in", "r") as file:
    data = file.read()

l = [int(line.split()[0]) for line in data.splitlines()]
r = [int(line.split()[1]) for line in data.splitlines()]

l.sort()
r.sort()

p1 = sum(abs(a - b) for a, b in zip(l, r))

p2 = sum(v * r.count(v) for v in l)

print(f"A: {p1}")
print(f"B: {p2}")

# AoC 2015 Day 1 #

with open("2015.1.in", "r") as file:
    data = file.read()

p1 = sum(1 if char == "(" else -1 for char in data)

p = 1
p2 = [p := p + (1 if char == "(" else -1) for char in data].index(-1)

print(f"A: {p1}")
print(f"B: {p2}")

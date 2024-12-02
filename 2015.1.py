# AoC 2015 Day 1 #

with open("2015.1.in", "r") as file:
    data = file.read()

p1 = sum(1 if char == "(" else -1 for char in data)

p2 = 0
for index, char in enumerate(data):
    if char == "(":
        p2 += 1
    else:
        p2 -= 1
    if p2 < 0:
        p2 = index + 1
        break

print(f"A: {p1}")
print(f"B: {p2}")

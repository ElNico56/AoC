# AoC 2015 Day 2 #

with open("2015.2.in", "r") as file:
    data = file.read()

lines = data.splitlines()

W = [int(line.split("x")[0]) for line in lines]
H = [int(line.split("x")[1]) for line in lines]
L = [int(line.split("x")[2]) for line in lines]

A = [l * w for l, w in zip(L, W)]
B = [w * h for w, h in zip(W, H)]
C = [h * l for h, l in zip(H, L)]

p1 = sum(2*a + 2*b + 2*c + min(a, b, c) for a, b, c in zip(A, B, C))

A = [l + w for l, w in zip(L, W)]
B = [w + h for w, h in zip(W, H)]
C = [h + l for h, l in zip(H, L)]

p2 = sum(min(2 * a, 2 * b, 2 * c) + w*h*l for w, h, l, a, b, c in zip(W, H, L, A, B, C))

print(f"A: {p1}")
print(f"B: {p2}")

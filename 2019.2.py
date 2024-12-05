# AoC 2019 day 2 #

with open("2019.2.in") as file:
    data = file.read()

mem = [int(x) for x in data.split(",")]
mem[1] = 12
mem[2] = 2

pc = 0
while True:
    opcode = mem[pc]
    match opcode:
        case 99:
            break
        case 1:
            a, b, c = mem[pc + 1], mem[pc + 2], mem[pc + 3]
            mem[c] = mem[a] + mem[b]
        case 2:
            a, b, c = mem[pc + 1], mem[pc + 2], mem[pc + 3]
            mem[c] = mem[a] * mem[b]
    pc += 4

print(f"A: {mem[0]}")

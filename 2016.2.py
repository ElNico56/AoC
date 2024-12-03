# AoC 2016 Day 2 #

with open("2016.2.in") as file:
    data = file.read()

lines = data.splitlines()

btn1 = ["0 0 0 0 0",\
        "0 1 2 3 0",\
        "0 4 5 6 0",\
        "0 7 8 9 0",\
        "0 0 0 0 0"]

btn2 = ["0 0 0 0 0 0 0",\
        "0 0 0 1 0 0 0",\
        "0 0 2 3 4 0 0",\
        "0 5 6 7 8 9 0",\
        "0 0 A B C 0 0",\
        "0 0 0 D 0 0 0",\
        "0 0 0 0 0 0 0"]

curr1 = [2, 2]
curr2 = [3, 2]
p1 = ""
p2 = ""
for line in lines:
    for char in line:
        match char:
            case 'U':
                curr1[0] -= 1
                if '0' == btn1[curr1[0]][curr1[1]]:
                    curr1[0] += 1
                curr2[0] -= 1
                if '0' == btn2[curr2[0]][curr2[1]]:
                    curr2[0] += 1
            case 'D':
                curr1[0] += 1
                if '0' == btn1[curr1[0]][curr1[1]]:
                    curr1[0] -= 1
                curr2[0] += 1
                if '0' == btn2[curr2[0]][curr2[1]]:
                    curr2[0] -= 1
            case 'L':
                curr1[1] -= 2
                if '0' == btn1[curr1[0]][curr1[1]]:
                    curr1[1] += 2
                curr2[1] -= 2
                if '0' == btn2[curr2[0]][curr2[1]]:
                    curr2[1] += 2
            case 'R':
                curr1[1] += 2
                if '0' == btn1[curr1[0]][curr1[1]]:
                    curr1[1] -= 2
                curr2[1] += 2
                if '0' == btn2[curr2[0]][curr2[1]]:
                    curr2[1] -= 2
    p1 += btn1[curr1[0]][curr1[1]]
    p2 += btn2[curr2[0]][curr2[1]]

print(f"A: {p1}")
print(f"B: {p2}")

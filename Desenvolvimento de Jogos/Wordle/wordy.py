import os

infile = open('./exite3PT.txt')

newopen = open('./newfile.txt', 'w')

for line in infile :
    if len(line) == 6:
        c = 0
        for i in [0,1,2,3,4]:
            if ord (line[i]) > 96 and ord (line[i]) < 123 or ord (line[i]) > 64 and ord (line[i]) < 91:
                continue
            else:
                c = 1
        if c == 0:
            print(line)
            newopen.write(line)
            newopen.write('\n')
newopen.close()

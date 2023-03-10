import os

infile = open('./PT.txt')

newopen = open('./newfile.txt', 'w')
a=[]
c = 0
for line in infile :

    if c == 0:
        line = line[:-1]
        newopen.write("\""+line+"\",")
        c = 1
    else:
        c = 0
newopen.close()


import os

for i in range(1,13):
    os.system('mkdir %i'%i)
    os.system('cp l.tex %i/l%i.tex'%(i,i))
#    os.system('cp e.tex e%i.tex'%i)

os.system('ls')

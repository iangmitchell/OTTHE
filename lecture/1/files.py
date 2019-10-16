ext='.txt'
for i in range(0,8):
    filename="%d%s"%(i,ext)
    f=open(filename,'w')
    f.write(str(i))
    f.close

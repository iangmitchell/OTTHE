import os
filename="files.sha"

#read just the hash
f=open(filename,'r')
hashes=[]
for line in f:
    word=line.split()
    hashes.append(word[0])

f.close()

for i in range(0,8):
    print hashes[i]

#first root
concatHash=hashes[0]+hashes[1]
filename="file01Simple.sha"
f=open(filename,'w')
f.write(concatHash)
f.close()
print 'Concat Hash:'
os.system('shasum -a 256 %s'%(filename))
os.system('shasum -a 256 file01Simple.sha')
#os.system('ls -%s'%('lt'))




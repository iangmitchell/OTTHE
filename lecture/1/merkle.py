import os
import hashlib


def sha256(s):
    h=hashlib.sha256()
    h.update(s)
    return (h.digest().encode('hex'))
    #should call binascii.hexlify(h.digest()) and import binascii

def readFilesAndWriteHashLevel0():
    ext=".txt"
    hashes=[]
    hashFilename="filesHashedLevel0.sha"
    outputFile=open(hashFilename,"w")
    #2^3=8
    for i in range(0,8):
        filename="%d%s"%(i,ext)
        inputFile=open(filename,'r')
        outputFile.write(sha256(inputFile.read()))
        outputFile.write('\n')
        inputFile.close()
    outputFile.close()


def removeNewlines(l):
    for i in range(0,len(l)):
        l[i]=l[i].rstrip("\n")
    return l

def readAndHashLevel1():
    hashFilename="filesHashedLevel1.sha"
    inputFile=open("filesHashedLevel0.sha")
    hashes=inputFile.readlines()
    #hashes=removeNewlines(hashes)
    inputFile.close()
    outputFile=open(hashFilename,'w')
    #2^2=4
    for i in range(0,8,2):
        combinedHashed=hashes[i]+hashes[i+1]
        print 'Combined Hash: Level 1: %d,%d: %s\n'%(i,i+1,combinedHashed)
        outputFile.write(sha256(combinedHashed))
        outputFile.write('\n')
    outputFile.close()

def readAndHashLevel2():
    hashFilename="filesHashedLevel2.sha"
    inputFile=open("filesHashedLevel1.sha")
    hashes=inputFile.readlines()
    #hashes=removeNewlines(hashes)
    inputFile.close()
    outputFile=open(hashFilename,'w')
    #2^1=2
    for i in range(0,4,2):
        combinedHashed=hashes[i]+hashes[i+1]
        outputFile.write(sha256(combinedHashed))
        outputFile.write('\n')
    outputFile.close()

def readAndHashRoot():
    hashFilename="fileHashedRoot.sha"
    inputFile=open("filesHashedLevel2.sha")
    hashes=inputFile.readlines()
    #hashes=removeNewlines(hashes)
    inputFile.close()
    outputFile=open(hashFilename,'w')
    combinedHashed=hashes[0]+hashes[1]
    outputFile.write(sha256(combinedHashed))
    outputFile.close()




readFilesAndWriteHashLevel0()
readAndHashLevel1()
readAndHashLevel2()
readAndHashRoot()
       

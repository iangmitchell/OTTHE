'''
author: i.mitchell@mdx.ac.uk
date: Oct 2019
Purpose:
    given a value of the lecture week, this script will process the slide for that week, e.g.,
    python slide.py -w 4
    output
    pdflatex 4/l4.tex
    resulting in l4.pdf
'''

import os
import argparse
parser=argparse.ArgumentParser()
parser.add_argument("-w","-week",type=int,nargs="+", help="Parses l?.tex in ? folder, outputs l?.pdf")
parser.add_argument("-t","-tar", help="Adds new file to tar file")
args=parser.parse_args()
if len(args.w)==1 and not args.t:
    week=args.w
    os.chdir(str(week))
    os.system('pdflatex l%s.tex'%(str(week)))
    os.chdir('..')
elif len(args.w)==2 and not args.t:
    print args.w[0]
    print args.w[1]
elif args.t and args.w:
    tarFile=args.t#"slides.tar.gz"
    print 'file: ',tarFile 
    os.system('tar -cvzf %s */l*.pdf'%(tarFile))



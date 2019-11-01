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
parser.add_argument("-w","-week",type=int, help="Parses l?.tex in ? folder, outputs l?.pdf")
args=parser.parse_args()
if args.w>=1:
    week=args.w
    os.chdir(week)
    os.system('pdflatex l%d.tex'%(week))
    os.chdir('..')


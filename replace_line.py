#!/usr/bin/env python

import glob
import sys


if len(sys.argv) != 4:
	print "replace_line.py [Folder] [phrase to replace] [phrase to be replaced with]"
	sys.exit()

directory = sys.argv[1]
phrase=sys.argv[2]
replace=sys.argv[3]
files=glob.glob(directory)
plus=100
items=[]
for i in files:
    f=open(i,"r+")
    items=f.readlines()
    pluswhat=["\n","\r\n"]
    for j in pluswhat:
    	if items.count(phrase+j) == True:
    		plus=pluswhat.index(j)
    		break
    pos=items.index(phrase+pluswhat[plus])
    items.remove(phrase+pluswhat[plus])
    items.insert(pos,replace+pluswhat[plus])
    f.seek(0)
    f.truncate()
    f.writelines(items)
    print f.name
    f.close()

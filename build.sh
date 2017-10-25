#!/bin/bash
# simple build script to build both public and private forms of resume
# with and without redacted phone number
# (c) 2017 Alison Chan alisonc@alisonc.net

pdflatex -jobname=resume '\input{resume}'
pdflatex -jobname=resume_pub '\def\PUBLIC{}\input{resume}'


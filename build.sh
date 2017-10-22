#!/bin/bash
pdflatex -jobname=resume '\input{resume}'
pdflatex -jobname=resume_pub '\def\PUBLIC{}\input{resume}'


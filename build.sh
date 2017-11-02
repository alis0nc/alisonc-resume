#!/bin/bash
# simple build script to build both public and private forms of resume
# with and without redacted phone number
# (c) 2017 Alison Chan alisonc@alisonc.net

pdflatex -jobname=resume '\input{resume}'
pdflatex -jobname=resume_pub '\def\PUBLIC{}\input{resume}'
pdflatex -jobname=resume_full '\def\SHALEM{}\input{resume}'
pdflatex -jobname=resume_full_pub '\def\SHALEM{}\def\PUBLIC{}\input{resume}'

# optimise file size
# TODO: don't assume pdfsizeopt is going to give us any better, actually 
# check before and after file sizes

type -P "pdfsizeopt" && {
    pdfsizeopt resume.pdf resume_opt.pdf
    pdfsizeopt resume_pub.pdf resume_pub_opt.pdf
    pdfsizeopt resume_full.pdf resume_full_opt.pdf
    pdfsizeopt resume_full_pub.pdf resume_full_pub_opt.pdf
    mv resume_opt.pdf resume.pdf
    mv resume_pub_opt.pdf resume_pub.pdf
    mv resume_full_opt.pdf resume_full.pdf
    mv resume_full_pub_opt.pdf resume_full_pub.pdf
}

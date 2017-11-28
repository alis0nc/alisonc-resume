@echo off
rem simple build batch script to build both public and private forms of resume
rem with and without redacted phone number
rem (c) 2017 Alison Chan alisonc@alisonc.net

rem assumes pdflatex and pdfsizeopt are on PATH

pdflatex.exe -jobname=resume "\input{resume}"
pdflatex.exe -jobname=resume_pub "\def\PUBLIC{}\input{resume}"
pdflatex.exe -jobname=resume_full "\def\SHALEM{}\input{resume}"
pdflatex.exe -jobname=resume_full_pub "\def\SHALEM{}\def\PUBLIC{}\input{resume}"

where /q pdfsizeopt.exe || exit /B
pdfsizeopt.exe resume.pdf resume_opt.pdf
pdfsizeopt.exe resume_pub.pdf resume_pub_opt.pdf
pdfsizeopt.exe resume_full.pdf resume_full_opt.pdf
pdfsizeopt.exe resume_full_pub.pdf resume_full_pub_opt.pdf
del resume.pdf
del resume_pub.pdf
del resume_full.pdf
del resume_full_pub.pdf
ren resume_opt.pdf resume.pdf
ren resume_pub_opt.pdf resume_pub.pdf
ren resume_full_opt.pdf resume_full.pdf
ren resume_full_pub_opt.pdf resume_full_pub.pdf
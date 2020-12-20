@echo off

SET PROJECTNAME=slowcounter

REM - if needed, replace this seeting with you ULX3S board variant (12k,25k or 45k instead of 85k)
SET BOARDVARIANT=85k

REM - run deploy using fujprog
fujprog %PROJECTNAME%_ulx3s%BOARDVARIANT%.bit
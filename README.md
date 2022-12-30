# Dinosaur-Parkour-RemainderBug
The code used to provide IBM with "Proof of Problem" that Remainder is sometimes wrong. 

Here is how I describe the problem to IBM:

DIVIDE 35354 by 20000 GIVING QQ REMAINDER RR
The quotient is correct but the remainder returned is 50182.

Divide 48119 BY 20000 GIVING QQ REMAINDER is 57417

It is NOT a 100 percent failure. DIVIDE 16532 BY 20000 remainder of 16532 is correct.
DIVIDE 30886 BY 20000 returns a remainder of 10886 which is correct.

Non Optimized code works. When the program is compiled using OPT(0), the issue does not occur.

OPT(2) fails. —>. COBOL 6.4 and COBOL 6.3
OPT(1) fails. —> only tested 6.4
OPT(0) WORK!!! Only tested 6.4

Compile option TRUNC (BIN, OPT, STD) does not appear to impact the issue.
Compile Options ARCH(), TUNE() does not appear to impact the issue used 10-10, 11-11, 12-12.

Dividend, Divisor, Quotient, and Remainder were all defined as UnSigned Native (COMP-5) Halfwords.

I did not test to determine if the sign had an impact.

I created video explaining how I tested using above items. See https://youtu.be/ilOFHaaL0-g


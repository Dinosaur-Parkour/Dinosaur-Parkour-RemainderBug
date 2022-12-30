       CBL OPT(2),DYNAM
       CBL TRUNC(OPT),DISPSIGN(SEP)
       CBL ARCH(12) TUNE(12)
       IDENTIFICATION DIVISION.
      *-----------------------
       PROGRAM-ID.    REMAIN1.
      *
      * Divide X By Y sometimes gives the wrong remainder.
      *
      *  These compiler options were only tested With this program.
      *  (only 5 Test cases Of which Test # 4 is the only one that
      *   gets invalid remainder.)
      *
      *     TRUNC           no impact        BIN, OPT, STD
      *     ARCH and TUNE   no impact        10-10, 11-11, 12-12
      *
      *   OPT does have an impact.
      *     OPT(2)  Fails
      *     OPT(1)  Fails
      *     OPT(0)  Works        <--- this can be a temp workaround
      *
      *
      * It ALSO failed OPT(2) COBOL 6.3.0 P220914
      *    backend: tr_v63_cobol_20220902_1654_YGZrgysBEe2vAuAW4fyMgw
      *     (I think I typed that correctly... can't cut and paste
      *     With the Mac emulation I currently use)
      *
      *     X       Y
      *   35795 / 20,000 = 00001 R: 49741    wrong
      *   48119 / 20,000 = 00002 R: 57417    wrong
      *   16532 / 20,000 = 00000 R: 16532
      *   04438 / 20,000 = 00000 R: 04438
      *   10818 / 20,000 = 00000 R: 10818
      *   09903 / 20,000 = 00000 R: 09903
      *   21644 / 20,000 = 00001 R: 01644
      *   21731 / 20,000 = 00001 R: 01731
      *   41109 / 20,000 = 00002 R: 64427    wrong
      *   09987 / 20,000 = 00000 R: 09987
      *   02406 / 20,000 = 00000 R: 02406
      *   30886 / 20,000 = 00001 R: 10886
      *   44838 / 20,000 = 00002 R: 60698    wrong
      *   10216 / 20,000 = 00000 R: 10216
      *   14661 / 20,000 = 00000 R: 14661
      *   60535 / 20,000 = 00003 R: 65001    wrong
      *   55113 / 20,000 = 00002 R: 50423    wrong
      *   60539 / 20,000 = 00003 R: 64997    wrong
      *   56440 / 20,000 = 00002 R: 49096    wrong
      *   59505 / 20,000 = 00002 R: 46031    wrong
      *   58227 / 20,000 = 00002 R: 47309    wrong
      *   36781 / 20,000 = 00001 R: 48755    wrong
      *   28097 / 20,000 = 00001 R: 08097
      *--------------------
       DATA DIVISION.
      *--------------------
       WORKING-STORAGE SECTION.

      * all variables used in the Divide are:
      *     Unsigned (Native) Binary Halfwords
       01  Stuff-Stuff-Stuff.
           05 Dividend       PIC  9(4)  Comp-5 Value 0.
           05 Divisor        PIC  9(4)  Comp-5 Value 0.
           05 Quotient       PIC  9(4)  Comp-5 Value 0.
           05 Remain         PIC  9(4)  Comp-5 Value 0.

       PROCEDURE DIVISION.
      *---------------------------------------------------------------
      *
      *---------------------------------------------------------------
       PROGRAM-CONTROL.
           Display 'Compile Time: ' Function WHEN-COMPILED
           Move 13 to Dividend
           Move 5  to Divisor
           Call 'A31BR14' Using Stuff-Stuff-Stuff
           Divide Dividend By Divisor Giving Quotient Remainder Remain
           Display 'Test 1: Divide ' dividend ' By ' Divisor
                   ' Giving '  QUOTIENT ' Remainder of: ' Remain


           Move 10003 to Dividend
           Move 10000 to Divisor
           Call 'A31BR14' Using Stuff-Stuff-Stuff
           Divide Dividend By Divisor Giving Quotient Remainder Remain
           Display 'Test 2: Divide ' dividend ' By ' Divisor
                   ' Giving '  QUOTIENT ' Remainder of: ' Remain


           Move 10003 to Dividend
           Move  5000 to Divisor
           Call 'A31BR14' Using Stuff-Stuff-Stuff
           Divide Dividend By Divisor Giving Quotient Remainder Remain
           Display 'Test 3: Divide ' dividend ' By ' Divisor
                   ' Giving '  QUOTIENT ' Remainder of: ' Remain


      *  Test 4 is the one that fails.... the others are correct
      *  See commments After Program ID for more combinations that fail.
           Move 35354 to Dividend
           Move 20000 to Divisor
           Call 'A31BR14' Using Stuff-Stuff-Stuff
           Divide Dividend By Divisor Giving Quotient Remainder Remain
           Display 'Test 4: Divide ' dividend ' By ' Divisor
                   ' Giving '  QUOTIENT ' Remainder of: ' Remain


           Move 35354 to Dividend
           Move 35000 to Divisor
           Call 'A31BR14' Using Stuff-Stuff-Stuff
           Divide Dividend By Divisor Giving Quotient Remainder Remain
           Display 'Test 5: Divide ' dividend ' By ' Divisor
                   ' Giving '  QUOTIENT ' Remainder of: ' Remain
           GOBACK.

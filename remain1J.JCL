//REMAIN64 JOB
//*
//   SET PGM=REMAIN1
//   SET LOADLIB=Z08115.DINO.LOADLIB
//*
//*
//*-------------------------------------------------------------------
//*  RUN THE PROGRAM
//*-------------------------------------------------------------------
//ALL      EXEC PGM=&PGM.,REGION=0M
//STEPLIB  DD DISP=SHR,DSN=&LOADLIB.
//SYSPUNCH DD SYSOUT=*
//SYSOUT   DD SYSOUT=*

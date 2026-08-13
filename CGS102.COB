       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CGS102.
       AUTHOR.        ARMADA DEMO ESTATE.
      *****************************************************************
      * RENDERS A STORED REPORT FOR ONE CUSTOMER.                     *
      * ADDED ON A BRANCH SO THE PULL REQUEST HAS FINDINGS OF ITS OWN.*
      *****************************************************************

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
         SOURCE-COMPUTER. IBM-370.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER          PIC X(08).
       01  WS-REPORT-LINE       PIC X(80).
       01  WS-COUNTER           PIC 9(04) VALUE ZERO.
       01  WS-UNUSED-WORK-AREA  PIC X(120).
       01  WS-TOTAL             PIC 9(04) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PARA.
           MOVE 'ACME0001' TO WS-CUSTOMER
           PERFORM RENDER-PARA
           GO TO EXIT-PARA.

       RENDER-PARA.
           MOVE ZERO TO WS-COUNTER
           PERFORM UNTIL WS-COUNTER > 10
               ADD 1 TO WS-COUNTER
               COMPUTE WS-TOTAL = WS-TOTAL + WS-COUNTER
               STRING 'REPORT FOR ' DELIMITED BY SIZE
                      WS-CUSTOMER   DELIMITED BY SIZE
                      INTO WS-REPORT-LINE
               DISPLAY WS-REPORT-LINE
           END-PERFORM.

       EXIT-PARA.
           STOP RUN.

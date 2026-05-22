       //---------------------------------Control options
       Ctl-opt Option(*Nodebugio) Nomain;

       /////////////////////////////////////////////////////////////////////////
       //
       //  Program: DATECONV
       //
       //  Description:
       //
       //    DATECONV is an SQL RPGLE service program that demonstrates how
       //    to create and consume service programs on IBM i.
       //
       //    The service program provides reusable procedures for converting
       //    dates between the following formats:
       //
       //      YMD - Year Month Day
       //      MDY - Month Day Year
       //      DMY - Day Month Year
       //
       //    Each conversion is logged to an SQL table for demonstration
       //    purposes.
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Exported Procedures:
       //
       //    YMD_To_MDY
       //      Converts Year Month Day to Month Day Year.
       //
       //    YMD_To_DMY
       //      Converts Year Month Day to Day Month Year.
       //
       //    MDY_To_YMD
       //      Converts Month Day Year to Year Month Day.
       //
       //    MDY_To_DMY
       //      Converts Month Day Year to Day Month Year.
       //
       //    DMY_To_YMD
       //      Converts Day Month Year to Year Month Day.
       //
       //    DMY_To_MDY
       //      Converts Day Month Year to Month Day Year.
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Internal Procedures:
       //
       //    Log_Conversion
       //
       //      Writes conversion information to the DATE_CONVERSIONS table.
       //      This procedure is used internally by the service program and
       //      is not exported for external use.
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Required SQL Table:
       //
       //    CREATE TABLE YOURLIB.DATE_CONVERSIONS
       //    (
       //      Conversion_Type CHAR(10) NOT NULL,
       //      Date_In         CHAR(10) NOT NULL,
       //      Date_Out        CHAR(10) NOT NULL,
       //      Created_Ts      TIMESTAMP NOT NULL
       //                      DEFAULT CURRENT TIMESTAMP
       //    );
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Build Sequence:
       //
       //    Step 1 - Create the Module
       //
       //      CRTSQLRPGI OBJ(YOURLIB/DATECONV)
       //         SRCFILE(YOURLIB/QRPGSQLSRC)
       //         SRCMBR(DATECONV)
       //         OBJTYPE(*MODULE)
       //         COMMIT(*NONE)
       //         CLOSQLCSR(*ENDMOD)
       //
       //    Step 2 - Create Binder Source
       //
       //      Create source member DATECONV in source file QSRVSRC.
       //      Export the six public conversion procedures.
       //
       //    Step 3 - Create the Service Program
       //
       //      CRTSRVPGM SRVPGM(YOURLIB/DATECONV)
       //         MODULE(YOURLIB/DATECONV)
       //         SRCFILE(YOURLIB/QSRVSRC)
       //         SRCMBR(DATECONV)
       //
       //    Step 4 - Create a Binding Directory
       //
       //      CRTBNDDIR BNDDIR(YOURLIB/DATECONV)
       //
       //    Step 5 - Add the Service Program to the Binding Directory
       //
       //      ADDBNDDIRE BNDDIR(YOURLIB/DATECONV)
       //         OBJ((YOURLIB/DATECONV *SRVPGM))
       //
       //    Step 6 - Compile the Consumer Program
       //
       //      Example consumer program: TESTDCONV
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Example Consumer Program:
       //
       //    TESTDCONV demonstrates how to prototype and invoke the exported
       //    procedures contained within this service program.
       //
       //    Running TESTDCONV performs all six date conversions and writes
       //    the results to the DATE_CONVERSIONS table.
       //
       /////////////////////////////////////////////////////////////////////////
       //
       //  Change History:
       //
       //    2026-05-22  J. Anderson
       //    Initial version.
       //
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Year Month Day to Month Day Year.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc YMD_To_MDY Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('YMD to MDY');

         Date_Out = %Char(%Date(Date_In:*YMD/) : *MDY/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Year Month Day to Day Month Year.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc YMD_To_DMY Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('YMD to DMY');

         Date_Out = %Char(%Date(Date_In:*YMD/) : *DMY/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Month Day Year to Year Month Day.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc MDY_To_YMD Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('MDY to YMD');

         Date_Out = %Char(%Date(Date_In:*MDY/) : *YMD/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Month Day Year to Day Month Year.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc MDY_To_DMY Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('MDY to DMY');

         Date_Out = %Char(%Date(Date_In:*MDY/) : *DMY/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Day Month Year to Year Month Day.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc DMY_To_YMD Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('DMY to YMD');

         Date_Out = %Char(%Date(Date_In:*DMY/) : *YMD/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Converts a date from one format to another.
       //               Day Month Year to Month Day Year.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc DMY_To_MDY Export;

         // ---------------------------------Procedure interface
         Dcl-PI *N Char(10);
           Date_In Char(10);
         End-PI;

         // ---------------------------------Local variables
         Dcl-S Date_Out Char(10);
         Dcl-S Conversion_Type Char(10) Inz('DMY to MDY');

         Date_Out = %Char(%Date(Date_In:*DMY/) : *MDY/);

         Log_Conversion(Conversion_Type:Date_In:Date_Out);

         Return Date_Out;

       End-Proc;

       /////////////////////////////////////////////////////////////////////
       //  Description: Writes the values to an SQL table for viewing results.
       /////////////////////////////////////////////////////////////////////

       Dcl-Proc Log_Conversion;

         Dcl-PI *N;
           Conversion_Type Char(10);
           Date_In         Char(10);
           Date_Out        Char(10);
         End-PI;

         Exec Sql
           Insert Into YOURLIB.Date_Conversions
             (Conversion_Type, Date_In, Date_Out)
           Values
             (:Conversion_Type, :Date_In, :Date_Out);

       End-Proc;

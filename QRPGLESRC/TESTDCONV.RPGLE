**FREE

Ctl-Opt DftActGrp(*No)
        Option(*Nodebugio)
        BndDir('DATECONV');

/////////////////////////////////////////////////////////////////////
//
//  Program: TESTDCONV
//
//  Description:
//
//    TESTDCONV demonstrates how to consume procedures contained
//    within the DATECONV service program.
//
//    The program initializes today's date in YMD, MDY, and DMY
//    formats and invokes each exported procedure in the DATECONV
//    service program.
//
//    The service program performs the conversions and logs the
//    results to the DATE_CONVERSIONS SQL table.
//
//  Procedures Tested:
//
//    YMD_To_MDY
//    YMD_To_DMY
//    MDY_To_YMD
//    MDY_To_DMY
//    DMY_To_YMD
//    DMY_To_MDY
//
/////////////////////////////////////////////////////////////////////
//
//  Compile Instructions:
//
//    CRTBNDRPG PGM(YOURLIB/TESTDCONV)
//       SRCFILE(YOURLIB/QRPGLESRC)
//       SRCMBR(TESTDCONV)
//
//    The DATECONV service program must exist and be available
//    through the DATECONV binding directory prior to compilation.
//
/////////////////////////////////////////////////////////////////////

//-------------------------------------------------------------------
// Service Program Procedure Prototypes
//-------------------------------------------------------------------

Dcl-Pr YMD_To_MDY Char(10);
  Date_In Char(10);
End-Pr;

Dcl-Pr YMD_To_DMY Char(10);
  Date_In Char(10);
End-Pr;

Dcl-Pr MDY_To_YMD Char(10);
  Date_In Char(10);
End-Pr;

Dcl-Pr MDY_To_DMY Char(10);
  Date_In Char(10);
End-Pr;

Dcl-Pr DMY_To_YMD Char(10);
  Date_In Char(10);
End-Pr;

Dcl-Pr DMY_To_MDY Char(10);
  Date_In Char(10);
End-Pr;

//-------------------------------------------------------------------
// Test Data Variables
//-------------------------------------------------------------------

Dcl-S YMD_Date Char(10);
Dcl-S MDY_Date Char(10);
Dcl-S DMY_Date Char(10);

//-------------------------------------------------------------------
// Conversion Results
//-------------------------------------------------------------------

Dcl-S YMD_To_MDY_Result Char(10);
Dcl-S YMD_To_DMY_Result Char(10);

Dcl-S MDY_To_YMD_Result Char(10);
Dcl-S MDY_To_DMY_Result Char(10);

Dcl-S DMY_To_YMD_Result Char(10);
Dcl-S DMY_To_MDY_Result Char(10);

//-------------------------------------------------------------------
// Initialize Today's Date in Each Supported Format
//-------------------------------------------------------------------

YMD_Date = %Char(%Date():*YMD/);
MDY_Date = %Char(%Date():*MDY/);
DMY_Date = %Char(%Date():*DMY/);

//-------------------------------------------------------------------
// Execute Service Program Conversion Procedures
//
// Each call exercises one exported procedure from the DATECONV
// service program. Successful execution results in a row being
// written to the DATE_CONVERSIONS table.
//-------------------------------------------------------------------

YMD_To_MDY_Result = YMD_To_MDY(YMD_Date);
YMD_To_DMY_Result = YMD_To_DMY(YMD_Date);

MDY_To_YMD_Result = MDY_To_YMD(MDY_Date);
MDY_To_DMY_Result = MDY_To_DMY(MDY_Date);

DMY_To_YMD_Result = DMY_To_YMD(DMY_Date);
DMY_To_MDY_Result = DMY_To_MDY(DMY_Date);

//-------------------------------------------------------------------
// End Program
//-------------------------------------------------------------------

*InLr = *On;
Return;

/////////////////////////////////////////////////////////////////////
//
//  Change History:
//
//    2026-05-22  J. Anderson
//    Initial version.
//
/////////////////////////////////////////////////////////////////////

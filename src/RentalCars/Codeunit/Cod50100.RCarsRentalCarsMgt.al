codeunit 50100 "RCars Rental Cars Mgt."
{
    procedure DeleteRCarsRentalSalesLine(LineNo: Code[20])
    var
        RCarsRentalSalesLine: Record "RCars Rental Sales Line";
    begin
        // if LineNo = '' then
        //     exit;
        RCarsRentalSalesLine.SetRange("Line No.", LineNo);
        RCarsRentalSalesLine.DeleteAll(true);
    end;
}

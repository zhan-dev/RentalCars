codeunit 50100 "RCars Rental Cars Mgt."
{
    //для удаления Sales Line вместе с Sales Header
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

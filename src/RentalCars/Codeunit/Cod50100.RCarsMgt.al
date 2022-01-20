codeunit 50100 "RCars Mgt."
{
    //для удаления Sales Line вместе с Sales Header
    procedure DeleteSalesLine(LineDocNo: Code[20])
    var
        SalesLine: Record "RCars Sales Line";
    begin
        // if LineNo = '' then
        //     exit;
        SalesLine.SetRange("Line Doc No.", LineDocNo);
        SalesLine.DeleteAll(true);

        SalesLine.Reset(); //не обязательный
    end;
}

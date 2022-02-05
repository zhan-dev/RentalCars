codeunit 50102 "RCars Posted Sales Header"
{
    procedure RCarsPosted(RCarsSalesHeader: Record "RCars Sales Header")
    var
        RCarsSalesLine: Record "RCars Sales Line";
        RCarsPostedSalesHeader: Record "RCars Posted Sales Header";
        RCarsPostedSalesLine: Record "RCars Posted Sales Line";
        orderPostedMsg: Label 'The order is posted as number %1 and moved from the %2 %3';
    begin
        RCarsPostedSalesHeader.TransferFields(RCarsSalesHeader);
        RCarsPostedSalesHeader."Doc. No." := '';
        RCarsPostedSalesHeader.Insert(true);

        RCarsSalesLine.SetRange("Line Doc No.", RCarsSalesHeader."Doc. No.");
        if RCarsSalesLine.FindSet() then
            repeat
                RCarsPostedSalesLine.TransferFields(RCarsSalesLine);
                RCarsPostedSalesLine.Validate("Line Doc No.", RCarsPostedSalesHeader."Doc. No.");
                RCarsPostedSalesLine.Insert(true);
            until RCarsSalesLine.Next() = 0;

        RCarsSalesHeader.Delete(true);
        RCarsSalesLine.DeleteAll(true);
        Message(orderPostedMsg, RCarsPostedSalesHeader."Doc. No.", RCarsPostedSalesHeader.TableCaption(), RCarsSalesHeader."Doc. No.");
    end;
}
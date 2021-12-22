codeunit 50101 "RCars Discount"
{
    // для скидки
    local procedure Calcdisc(ItemNo: code[20]; CustomerNo: code[20]; UOM: Code[10])
    var
        SalesLineDiscount: Record "Sales Line Discount";
    begin
        SalesLineDiscount.SetRange(Code, ItemNo);
        SalesLineDiscount.SetRange(Type, SalesLineDiscount.Type::Item);
        SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."Sales Type"::"All Customers");
        if CustomerNo <> '' then begin
            SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."Sales Type"::Customer);
            SalesLineDiscount.SetRange("Sales Code", "CustomerNo");
        end;
        if UOM <> '' then begin
            SalesLineDiscount.SetRange("Unit of Measure Code", UOM);
        end;
    end;
}
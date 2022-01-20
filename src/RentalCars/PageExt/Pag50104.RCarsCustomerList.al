pageextension 50104 "RCars Customer List" extends "Customer List"
{
    layout
    {
        addafter(Name)
        {

            field("RCars Discount"; Rec."RCars Discount")
            {
                ToolTip = 'Specifies the value of the Discount field.';
                ApplicationArea = All;
            }
        }
    }
    // trigger OnOpenPage()
    // var
    //     Customer: Record Customer;
    // begin
    //     if Customer.FindSet() then
    //         repeat
    //             Customer."Phone No." := '55-25-445';
    //             Customer.Modify();
    //         until Customer.Next() = 0;
    // end;
}

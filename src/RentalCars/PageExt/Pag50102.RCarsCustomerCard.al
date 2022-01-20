pageextension 50102 "RCars Customer Card" extends "Customer Card" //21
{
    layout
    {
        addafter(General)
        {
            group("RCars Rental")
            {
                Caption = 'RCars Rental';
                field("RCars Discount"; Rec."RCars Discount")
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
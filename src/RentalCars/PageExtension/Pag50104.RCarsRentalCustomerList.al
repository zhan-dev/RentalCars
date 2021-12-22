pageextension 50104 "RCars Rental Customer List" extends "Customer List"
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
}

pageextension 50105 "Rental Car Item Lookup Card" extends "Item Lookup"
{
    layout
    {
        addafter("No.")
        {

            field("RCars Name"; Rec."RCars Name")
            {
                ToolTip = 'Specifies the value of the Name field.';
                ApplicationArea = All;
            }
            field("RCars Discount"; Rec."RCars Discount")
            {
                ToolTip = 'Specifies the value of the Discount field.';
                ApplicationArea = All;
            }
            field("RCars Car Model"; Rec."RCars Car Model")
            {
                ToolTip = 'Specifies the value of the Car Model field.';
                ApplicationArea = All;
            }
            field("RCars Car Color"; Rec."RCars Car Color")
            {
                ToolTip = 'Specifies the value of the Car Color field.';
                ApplicationArea = All;
            }
            field("RCars Year"; Rec."RCars Year")
            {
                ToolTip = 'Specifies the value of the Year field.';
                ApplicationArea = All;
            }
            field("RCars Was Crash"; Rec."RCars Was Crash")
            {
                ToolTip = 'Specifies the value of the Was Crash field.';
                ApplicationArea = All;
            }
        }
    }
}

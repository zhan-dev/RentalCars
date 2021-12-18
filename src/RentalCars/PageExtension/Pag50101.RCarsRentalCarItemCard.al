pageextension 50101 "RCars Rental Car Item Card" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group("RCars Cars")
            {
                field("RCars Name"; Rec."RCars Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("RCars Car Model"; Rec."RCars Car Model")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Car Model field.';
                }
                field("RCars Car Color"; Rec."RCars Car Color")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Car Color field.';
                }
                field("RCars Year"; Rec."RCars Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("RCars Was Crash"; Rec."RCars Was Crash")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Was Crash field.';
                }
            }
        }
    }
}

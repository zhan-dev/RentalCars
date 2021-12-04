page 50101 "RCars Rental Car Card"
{

    Caption = 'Rental Car Card';
    PageType = Card;
    SourceTable = "RCars Rental Car";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Car Model"; Rec."Car Model")
                {
                    ToolTip = 'Specifies the value of the Car Model field.';
                    ApplicationArea = All;
                }
                field("Car Color"; Rec."Car Color")
                {
                    ToolTip = 'Specifies the value of the Car Color field.';
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.';
                    ApplicationArea = All;
                }
                field("Was Crash"; Rec."Was Crash")
                {
                    ToolTip = 'Specifies the value of the Was Crash field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}

page 50100 "RCars Rental Car List"
{

    ApplicationArea = All;
    Caption = 'Rental Car List';
    PageType = List;
    SourceTable = "RCars Rental Car";
    UsageCategory = Lists;

    CardPageId = "RCars Rental Car Card"; //ссылка  на карточку 
    Editable = false; // запрет редактирования

    layout
    {
        area(content)
        {
            repeater(General)
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

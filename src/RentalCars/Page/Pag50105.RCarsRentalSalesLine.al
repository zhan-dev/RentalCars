page 50105 "RCars Rental Sales Line" //доп. таблица с инфой о заказе (привязанная к другой карточке)
{

    Caption = 'Rental Sales Line';
    PageType = ListPart;
    SourceTable = "RCars Rental Sales Line";

    AutoSplitKey = true; //авто ключ в связанной таблице

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;
                }
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
                field("Start  Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start  Date field.';
                    ApplicationArea = All;
                }
                field("End  Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End  Date field.';
                    ApplicationArea = All;
                }
                field("Use Car Days"; Rec."Use Car Days")
                {
                    ToolTip = 'Specifies the value of the Use Car Days field.';
                    ApplicationArea = All;
                }

            }
        }
    }

}

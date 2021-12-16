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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}

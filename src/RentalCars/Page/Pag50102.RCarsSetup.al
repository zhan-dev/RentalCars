page 50102 "RCars Setup" //доп. таблица для авто генерации ключа
{

    Caption = 'RCars Setup';
    PageType = Card;
    SourceTable = "RCars Setup";

    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Rental Car Nos."; Rec."Rental Car Nos.")
                {
                    ToolTip = 'Specifies the value of the Rental Car Nos. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

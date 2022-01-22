page 50102 "RCars Setup Card" //доп. таблица для авто генерации ключа
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
                field("Nos."; Rec."Nos.")
                {
                    ToolTip = 'Specifies the value of the Nos. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

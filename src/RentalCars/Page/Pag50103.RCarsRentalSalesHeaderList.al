page 50103 "RCars Rental Sales Header List"
{

    ApplicationArea = All;
    Caption = 'Rental Sales Header';
    PageType = List;
    SourceTable = "RCars Rental Sales Header";
    UsageCategory = Lists;

    CardPageId = "RCars Rental Sales Header Card"; //ссылка  на карточку 
    Editable = false; // запрет редактирования

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Doc. No."; Rec."Doc. No.")
                {
                    ToolTip = 'Specifies the value of the Doc. No. field.';
                    ApplicationArea = All;
                }
                field("Salesperson No."; Rec."Salesperson No.")
                {
                    ToolTip = 'Specifies the value of the Salesperson No. field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Customer Address field.';
                    ApplicationArea = All;
                }
                field(Discount; Rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    ApplicationArea = All;
                }

            }
        }
    }

}

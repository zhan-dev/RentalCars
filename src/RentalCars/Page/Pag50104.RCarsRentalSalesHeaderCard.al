page 50104 "RCars Rental Sales Header Card"
{

    Caption = 'Rental Sales Header';
    PageType = Card;
    SourceTable = "RCars Rental Sales Header";

    layout
    {
        area(content)
        {
            group(General)
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
            }
            part(SalesLines; "RCars Rental Sales Line")
            {
                ApplicationArea = All;
                SubPageLink = "Line No." = field("Doc. No."); //привязка к ключу
                UpdatePropagation = Both; //обновление форм
            }
        }
    }

}

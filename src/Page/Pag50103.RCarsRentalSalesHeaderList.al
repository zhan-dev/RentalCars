page 50103 "RCars Rental Sales Header List"
{

    ApplicationArea = All;
    Caption = 'Rental Sales Header';
    PageType = List;
    SourceTable = "RCars Rental Sales Header";
    UsageCategory = Lists;

    CardPageId = "RCars Rental Sales Header Card";
    Editable = false;

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
            }
        }
    }

}

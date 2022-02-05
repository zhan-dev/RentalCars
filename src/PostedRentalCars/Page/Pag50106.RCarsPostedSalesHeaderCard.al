page 50106 "RCars Posted Sales Header Card"
{

    Caption = 'Posted Sales Header';
    PageType = Card;
    SourceTable = "RCars Posted Sales Header";
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
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
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ToolTip = 'Specifies the value of the Salesperson Name field.';
                    ApplicationArea = All;
                }
                field("Salesperson E-Mail"; Rec."Salesperson E-Mail")
                {
                    ToolTip = 'Specifies the value of the Email field.';
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
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                    ApplicationArea = All;
                }

            }
            //Связь под ListPart
            part(PostedSalesLines; "RCars Posted Sales Line")
            {
                ApplicationArea = All;
                SubPageLink = "Line Doc No." = field("Doc. No."); //привязка к ключу
                UpdatePropagation = Both; //обновление форм
                Editable = false;
            }
        }
    }

}

page 50107 "RCars Posted Sales Line" //доп. таблица с инфой о заказе (привязанная к другой карточке)
{

    Caption = 'Posted Sales Line';
    PageType = ListPart;
    SourceTable = "RCars Posted Sales Line";
    DeleteAllowed = false;

    AutoSplitKey = true; //авто ключ в связанной таблице

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("My Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line Doc No.")
                {
                    ToolTip = 'Specifies the value of the Line Doc No. field.';
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
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start  Date field.';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End  Date field.';
                    ApplicationArea = All;
                }
                field("Service Day"; Rec."Service Day")
                {
                    ToolTip = 'Specifies the value of the Service Day field.';
                    ApplicationArea = All;
                }
                field("Use Car Days"; Rec."Use Car Days")
                {
                    ToolTip = 'Specifies the value of the Use Car Days field.';
                    ApplicationArea = All;
                }
                field("RCars Discount"; Rec."RCars Discount")
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                    ApplicationArea = All;
                }
                field("RCars Cost Per Day"; Rec."RCars Cost Per Day")
                {
                    ToolTip = 'Specifies the value of the Cost Per Day field.';
                    ApplicationArea = All;
                }
                field("RCars Cost"; Rec."RCars Cost")
                {
                    ToolTip = 'Specifies the value of the RCars Cost field.';
                    ApplicationArea = All;
                }

            }
            group(Total)
            {
                field("Amount Cost"; Rec."Amount Cost")
                {
                    ToolTip = 'Specifies the value of the Amount Cost field.';
                    ApplicationArea = All;
                }
                field("Amount Discount"; Rec."Amount Discount")
                {
                    ToolTip = 'Specifies the value of the Amount Discount field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportExportOrderLines)
            {
                ApplicationArea = All;
                Caption = 'Export\Import RCars Order Lines';
                RunObject = xmlport "RCars Order Sales Line";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Export;
            }
        }
    }

}

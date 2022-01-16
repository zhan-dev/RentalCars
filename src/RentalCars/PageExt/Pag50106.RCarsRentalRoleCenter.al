pageextension 50106 "RCars Rental RoleCenter" extends "Order Processor Role Center"
{
    actions
    {
        addafter(Action63)
        {
            group("RCars Rental")
            {
                Caption = 'test';
                Image = FiledPosted;
                ToolTip = 'View history for sales, shipments, and inventory.';

                action("RCars Vendors")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor List";
                    ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
                }
            }
        }
    }
}


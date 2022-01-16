pageextension 50103 "Sales & Receivables Setup Card" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Direct Debit Mandate Nos.")
        {
            field("RCars Rental Order"; Rec."RCars Rental Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Rental Order field.';
            }
        }
    }

}
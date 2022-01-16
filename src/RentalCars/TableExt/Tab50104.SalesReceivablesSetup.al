tableextension 50104 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "RCars Rental Order"; Code[20])
        {
            Caption = 'Rental Order';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}

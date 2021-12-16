tableextension 50100 "RCars Rental Salesperson" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; "RCars No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(50110; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(50120; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
    }
}

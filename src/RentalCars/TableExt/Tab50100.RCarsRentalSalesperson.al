tableextension 50100 "RCars Rental Salesperson" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50110; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
    }
}

tableextension 50100 "RCars Rental Salesperson" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; "RCars Year"; Date)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
    }
}

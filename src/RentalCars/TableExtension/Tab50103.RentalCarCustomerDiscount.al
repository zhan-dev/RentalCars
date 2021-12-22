tableextension 50103 "Rental Car/Customer Discount " extends "Price List Line"
{
    fields
    {
        field(50100; "RCars Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(50110; "RCars Type"; Enum "RCars Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(50120; "RCars Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = CustomerContent;
        }
    }
}

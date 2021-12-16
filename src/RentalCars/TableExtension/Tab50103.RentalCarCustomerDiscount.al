tableextension 50103 "Rental Car/Customer Discount " extends "Price List Line"
{
    fields
    {
        field(50100; "RCars Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(50110; "RCars Type"; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = Customer,Car;
        }
        field(50120; "RCars Value"; Decimal)
        {
            Caption = 'Value';
            DataClassification = CustomerContent;

            // TableRelation =
            // if ("RCars Type" = const(Customer))
            // else
            // if ("RCars Type" = const(Car))
        }
    }
}

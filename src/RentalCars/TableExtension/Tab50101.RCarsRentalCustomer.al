tableextension 50101 "RCars Rental Customer" extends Customer
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
        field(50120; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
        }
    }
}

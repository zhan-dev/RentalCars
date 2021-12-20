tableextension 50101 "RCars Rental Customer" extends Customer //18
{
    fields
    {
        field(50110; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(50200; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }
    }
}

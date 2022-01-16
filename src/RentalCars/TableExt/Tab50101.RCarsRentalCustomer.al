tableextension 50101 "RCars Rental Customer" extends Customer //18
{
    fields
    {
        field(50200; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
            // TableRelation = "Price list line"."RCars Code" where("RCars Type" = const(Customer));
        }
    }
}

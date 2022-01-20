tableextension 50102 "RCars Item" extends Item
{
    fields
    {
        field(50110; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            TableRelation = "Item Category".Code;
        }
        field(50120;
        "RCars Car Model";
        Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
        }
        field(50130; "RCars Car Color"; Enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
        }
        field(50140; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(50150; "RCars Was Crash"; Boolean)
        {
            Caption = 'Was Crash';
            DataClassification = CustomerContent;
        }
        field(50200; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
            // TableRelation = "Price list line"."RCars Code" where("RCars Type" = const(Customer));
        }
        field(50250; "RCars Cost per Day"; Decimal)
        {
            Caption = 'Cost per Day';
            DataClassification = CustomerContent;
        }
    }
}

tableextension 50102 "RCars Rental Car Item" extends Item
{
    fields
    {
        field(50110; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(50120; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            TableRelation = "Price list line"."RCars Code" where("RCars Type" = const(Customer));
        }
        field(50130; "RCars Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
        }
        field(50140; "RCars Car Color"; Enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
        }
        field(50150; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(50160; "RCars Was Crash"; Boolean)
        {
            Caption = 'Was Crash';
            DataClassification = CustomerContent;
        }
    }
}

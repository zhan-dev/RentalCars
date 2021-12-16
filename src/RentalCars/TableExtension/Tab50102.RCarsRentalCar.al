tableextension 50102 "RCars Rental Car" extends Item
{
    fields
    {
        field(50100; "RCars Item No."; Code[20])
        {
            Caption = 'Item No.';
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

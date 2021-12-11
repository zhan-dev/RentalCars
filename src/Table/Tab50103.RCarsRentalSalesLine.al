table 50103 "RCars Rental Sales Line"
{
    Caption = 'Rental Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Line No."; Code[20])
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            TableRelation = "RCars Rental Sales Header"."Doc. No."; //выпадающий список ключа, что бы можно было создать кучу пустых строк в списке
        }
        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
        }
        field(30; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(100; "My Line No."; Integer)
        {
            Caption = 'My Line No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Line No.", "My Line No.")
        {
            Clustered = true;
        }
    }

}

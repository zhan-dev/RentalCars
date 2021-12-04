table 50100 "RCars Rental Car"
{
    Caption = 'Rental Car';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(10; "Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
        }
        field(20; "Car Color"; enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
        }
        field(30; Year; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(40; "Was Crash"; Boolean)
        {
            Caption = 'Was Crash';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}

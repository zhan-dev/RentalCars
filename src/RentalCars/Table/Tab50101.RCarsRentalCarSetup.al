table 50101 "RCars Rental Car Setup"  // доп. таблица для авто генерации ключа (связующая)
{
    Caption = 'Rental Car Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Rental Car Nos."; Code[20])
        {
            Caption = 'Rental Car Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

}

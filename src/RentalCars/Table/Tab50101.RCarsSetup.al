table 50101 "RCars Setup"  // доп. таблица для авто генерации ключа (связующая)
{
    Caption = 'Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Nos."; Code[20])
        {
            Caption = 'Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series"; //308
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

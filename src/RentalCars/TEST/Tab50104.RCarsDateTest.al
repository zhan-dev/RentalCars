table 50104 "RCars Date Test"
{
    Caption = 'Date Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Refarence for  date calc"; Date)
        {
            Caption = 'Refarence for  date calc';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
            begin
                Datess();
            end;
        }
        field(3; "Date Formula"; DateFormula)
        {
            Caption = 'Date Formula';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
            begin
                Datess();
            end;
        }
        field(4; "Date Result"; Date)
        {
            Caption = 'Date Result';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    local procedure Datess()
    var
    begin
        "Date Result" := CalcDate("Date Formula", "Refarence for  date calc");
    end;
}

table 50100 "RCars Rental Car"
{
    Caption = 'Rental Car';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                RentalCarSetup: Record "RCars Rental Car Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    TestNoSeries(RentalCarSetup);
                    NoSeriesMgt.TestManual(RentalCarSetup."Rental Car Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
        }
        field(30; "Car Color"; enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
        }
        field(40; Year; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
        }
        field(50; "Was Crash"; Boolean)
        {
            Caption = 'Was Crash';
            DataClassification = CustomerContent;
        }
        field(200; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        InitInsert();
    end;

    local procedure InitInsert()
    var
        RentalCarSetup: Record "RCars Rental Car Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;

        TestNoSeries(RentalCarSetup);
        NoSeriesMgt.InitSeries(RentalCarSetup."Rental Car Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    end;

    local procedure TestNoSeries(var RentalCarSetup: Record "RCars Rental Car Setup")
    begin
        if not RentalCarSetup.Get() then begin
            RentalCarSetup.Insert();
            Commit();
        end;
        RentalCarSetup.TestField("Rental Car Nos.");
    end;

}

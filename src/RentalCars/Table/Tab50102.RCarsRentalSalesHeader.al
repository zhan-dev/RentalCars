table 50102 "RCars Rental Sales Header"
{
    Caption = 'Rental Sales Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Doc. No."; Code[20])
        {
            Caption = 'Doc. No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                RentalCarSetup: Record "RCars Rental Car Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "Doc. No." <> xRec."Doc. No." then begin
                    TestNoSeries(RentalCarSetup);
                    NoSeriesMgt.TestManual(RentalCarSetup."Rental Car Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Salesperson No."; Code[20])
        {
            Caption = 'Salesperson No.';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(30; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
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
        key(PK; "Doc. No.")
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
        RCarsRentalCarSetup: Record "RCars Rental Car Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "Doc. No." <> '' then
            exit;

        TestNoSeries(RCarsRentalCarSetup);
        NoSeriesMgt.InitSeries(RCarsRentalCarSetup."Rental Car Nos.", xRec."No. Series", 0D, "Doc. No.", "No. Series");
    end;

    local procedure TestNoSeries(var RentalCarSetup: Record "RCars Rental Car Setup")
    begin
        if not RentalCarSetup.Get() then begin
            RentalCarSetup.Insert();
            Commit();
        end;
        RentalCarSetup.TestField("Rental Car Nos.");
    end;

    //процедура на удаление записи из таблицы заказа, и связанной с ней таблицы одновременно
    trigger OnDelete()
    var
        RCarsRentalCarsMgt: Codeunit "RCars Rental Cars Mgt.";
    begin
        RCarsRentalCarsMgt.DeleteRCarsRentalSalesLine(Rec."Doc. No.");
    end;

}

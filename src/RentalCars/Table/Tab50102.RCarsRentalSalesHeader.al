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

            NotBlank = true;
            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Customer No." <> '' then begin
                    Customer.Get("Customer No.");
                    Rec.Validate("Customer Name", Customer.Name);
                    Rec.Validate("Customer Address", Customer.Address);
                end;
                // SetDiscount();
            end;
        }
        field(40; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            Editable = false;
        }
        field(50; "Customer Address"; Text[100])
        {
            Caption = 'Customer Address';
            DataClassification = CustomerContent;
            TableRelation = Customer.Address;
            Editable = false;
        }
        field(60; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            Editable = false;
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

    //No Series ключ
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

    // No Series
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



    local procedure SetDiscount()
    var
        Customer: Record Customer;
    begin
        if Rec."Customer No." <> '' then
            Customer.get();

        Rec."Discount" := Customer."RCars Discount";
    end;

}

table 50102 "RCars Sales Header"
{
    Caption = 'Sales Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Doc. No."; Code[20])
        {
            Caption = 'Doc. No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Setup: Record "RCars Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "Doc. No." <> xRec."Doc. No." then begin
                    TestNoSeries(Setup);
                    NoSeriesMgt.TestManual(Setup."Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; "Salesperson No."; Code[20])
        {
            Caption = 'Salesperson No.';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code;

            trigger OnValidate()
            var
                SalespersonPurchaser: Record "Salesperson/Purchaser";
            begin
                if "Salesperson No." <> '' then begin
                    SalespersonPurchaser.Get("Salesperson No.");
                    Rec.Validate("Salesperson Name", SalespersonPurchaser.Name);
                    Rec.Validate("Salesperson E-Mail", SalespersonPurchaser."E-Mail");
                end;
            end;
        }
        field(23; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Name;
            Editable = false;
        }
        field(26; "Salesperson E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser"."E-Mail";
            Editable = false;
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
        field(70; "Order Date"; Date)
        {
            Caption = 'Order Date';
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
        OrderDate();
    end;

    local procedure InitInsert() //No. Series
    var
        Setup: Record "RCars Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "Doc. No." <> '' then // для ввода ключа вручную
            exit;
        TestNoSeries(Setup);
        NoSeriesMgt.InitSeries(Setup."Nos.", xRec."No. Series", 0D, "Doc. No.", "No. Series");
    end;

    // No. Series
    local procedure TestNoSeries(var Setup: Record "RCars Setup")
    begin
        if not Setup.Get() then begin
            Setup.Insert();
            Commit();
        end;
        Setup.TestField("Nos."); //проверка на ''
    end;

    //Delete SalesHeader  with all SalesLine(listpart)
    trigger OnDelete()
    var
        Mgt: Codeunit "RCars Mgt.";
    begin
        Mgt.DeleteSalesLine(Rec."Doc. No.");
    end;



    local procedure SetDiscount()
    var
        Customer: Record Customer;
    begin
        if Rec."Customer No." <> '' then
            Customer.get();

        Rec."Discount" := Customer."RCars Discount";
    end;

    local procedure OrderDate()
    var
    begin
        "Order Date" := WorkDate;
    end;

}

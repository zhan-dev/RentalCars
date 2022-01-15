table 50103 "RCars Rental Sales Line"
{
    Caption = 'Rental Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Line Doc No."; Code[20])
        {
            Caption = 'Line Doc No.';
            DataClassification = CustomerContent;
            TableRelation = "RCars Rental Sales Header"."Doc. No."; //автозамена ключа в доп. таблице при смене ключа в основной без потери данных
        }
        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item."No." where(Type = const(Rental));

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if "Item No." <> '' then begin
                    Item.Get("Item No.");
                    Rec.Validate("RCars Name", Item."RCars Name");
                    Rec.Validate("RCars Car Model", Item."RCars Car Model");
                    Rec.Validate("RCars Car Color", Item."RCars Car Color");
                    Rec.Validate("RCars Year", Item."RCars Year");
                    Rec.Validate("RCars Was Crash", Item."RCars Was Crash");
                end;
                // SetDiscount();
            end;
        }
        field(30; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            TableRelation = Item."RCars Name"; //уточнение фильтра
            // ValidateTableRelation = false; //нужно уточнить
            Editable = false;
        }

        field(50; "RCars Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Car Model";
            // ValidateTableRelation = false;
            Editable = false;
        }
        field(60; "RCars Car Color"; Enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Car Color";
            // ValidateTableRelation = false;
            Editable = false;
        }
        field(70; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Year";
            // ValidateTableRelation = false;
            Editable = false;
        }
        field(80; "RCars Was Crash"; Boolean)
        {
            Caption = 'Was Crashed';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Was Crash";
            // ValidateTableRelation = false;
            Editable = false;
        }
        field(90; "Start Date"; Date)
        {
            Caption = 'Start  Date';
            DataClassification = CustomerContent;
            NotBlank = false;
        }
        field(100; "End Date"; Date)
        {
            Caption = 'End  Date';
            DataClassification = CustomerContent;
            NotBlank = false;

            trigger OnValidate()
            begin
                ServiceDays(); //под резерв на сл. день
                UseCarDays();
                ServiceReserv()
            end;

        }
        field(110; "Service Day"; Date)
        {
            Caption = 'Service Day';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(120; "Use Car Days"; Integer)
        {
            Caption = 'Use Car Days';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(150; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            // TableRelation = Item;
        }
        field(160; "Amount Discount"; Decimal)
        {
            Caption = 'Amount Discount';

            FieldClass = FlowField; //вычисляемое  поле
            Editable = false;

            CalcFormula = max("RCars Rental Sales Line"."RCars Discount" where("Line Doc No." = field("Line Doc No.")));
        }
        field(200; "My Line No."; Integer) //для работы autosplitkey
        {
            Caption = 'My Line No.';
            DataClassification = CustomerContent;
            Editable = false; //при Enabled (краш в проэкте)
        }
    }
    keys
    {
        key(PK; "Line Doc No.", "My Line No.")
        {
            Clustered = true;
        }
    }

    //процедура добавления скидки
    local procedure SetDiscount()
    var
        Item: Record Item;
    begin
        if Rec."Item No." <> '' then
            Item.get();

        Rec."RCars Discount" := Item."RCars Discount";
        xRec."RCars Discount" := 0;
    end;


    local procedure ServiceDays()
    begin
        "Service Day" := "End Date" + 1;
    end;

    local procedure ServiceReserv()
    begin
        if ("End Date" = "Service Day") or ("Start Date" = "Service Day") then begin
            Message('this date is service date');
            "End Date" := 0D;
        end;
    end;

    local procedure UseCarDays()
    var
    begin
        if ("Start Date" = 0D) or ("Start Date" > "End Date") then begin
            Message('Error');
            "Start Date" := 0D;
        end
        else
            "Use Car Days" := "End Date" - "Start Date";
    end;
}

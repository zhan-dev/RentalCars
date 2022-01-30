table 50103 "RCars Sales Line"
{
    Caption = 'Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Line Doc No."; Code[20])
        {
            Caption = 'Line Doc No.';
            DataClassification = CustomerContent;
            TableRelation = "RCars Sales Header"."Doc. No."; //автозамена ключа в доп. таблице при смене ключа в основной без потери данных
            Editable = false;
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
                    Rec.Validate("RCars Discount", Item."RCars Discount");
                    Rec.Validate("RCars Cost Per Day", Item."RCars Cost per Day");
                    Rec.Validate("RCars Cost", Item."RCars Cost per Day");
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
            TableRelation = Item."RCars Car Color";
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


            trigger OnValidate()
            begin
                CalcLineFields();
            end;
        }
        field(100; "End Date"; Date)
        {
            Caption = 'End  Date';
            DataClassification = CustomerContent;
            NotBlank = false;

            trigger OnValidate()
            begin
                CalcLineFields();
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
            TableRelation = Item."RCars Discount";

            Editable = false;
        }
        field(170; "RCars Cost Per Day"; Decimal)
        {
            Caption = 'RCars Cost Per Day';
            DataClassification = CustomerContent;
            TableRelation = Item."RCars Cost per Day";
            Editable = false;
        }
        field(175; "RCars Cost"; Decimal)
        {
            Caption = 'RCars Cost';
            DataClassification = CustomerContent;
            TableRelation = Item."RCars Cost per Day";
            Editable = false;
        }
        field(180; "Amount Cost"; Decimal)
        {
            Caption = 'Amount Cost';

            FieldClass = FlowField; //вычисляемое  поле, не хранится в базе
            Editable = false;

            CalcFormula = sum("RCars Sales Line"."RCars Cost" where("Line Doc No." = field("Line Doc No.")));
        }
        field(190; "Amount Discount"; Decimal)
        {
            Caption = 'Amount Discount';

            FieldClass = FlowField; //вычисляемое  поле, не хранится в базе
            Editable = false;

            CalcFormula = max("RCars Sales Line"."RCars Discount" where("Line Doc No." = field("Line Doc No.")));
        }
        field(200; "Line No."; Integer) //для работы autosplitkey
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Line Doc No.", "Line No.")
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


    local procedure CalcLineFields()
    var
    begin

        if ("End Date" = 0D) then begin
            Message('Check Dates');
            "End Date" := "Start Date" + 1;
        end;

        if ("Start Date" = 0D) or ("Start Date" <= WorkDate) then begin
            Message('Check Dates');
            "Start Date" := "End Date" - 1;
        end;

        if ("Start Date" >= "End Date") then begin
            Message('Check Dates again');
            "Start Date" := xRec."Start Date";
            "End Date" := xRec."End Date";
        end;

        if ("Start Date" <= WorkDate) or ("End Date" <= WorkDate) then begin
            Message('This Days go one');
            "Start Date" := System.Today();
            "Start Date" := System.Today() + 1;
        end;

        "Use Car Days" := "End Date" - "Start Date";

        "Service Day" := "End Date" + 1;

        "RCars Cost" := "RCars Cost Per Day" * "Use Car Days";

    end;

}

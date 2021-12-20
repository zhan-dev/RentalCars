table 50103 "RCars Rental Sales Line"
{
    Caption = 'Rental Sales Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Line No."; Code[20])
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            TableRelation = "RCars Rental Sales Header"."Doc. No."; //автозамена ключа в доп. таблице при смене ключа в основной без потери данных
        }
        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
        }
        field(30; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            // TableRelation = item."RCars Name";
            // TableRelation = item."RCars Name" where(Type = const(Rental));*****************
        }
        field(40; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            // TableRelation = item."RCars Discount";
        }
        field(50; "RCars Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
            // TableRelation = item."RCars Car Model";
        }
        field(60; "RCars Car Color"; Enum "RCars Car Color")
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            // TableRelation = item."RCars Car Color";
        }
        field(70; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
            // TableRelation = item."RCars Year";
        }
        field(80; "Start Date"; Date)
        {
            Caption = 'Start  Date';
            DataClassification = CustomerContent;
        }
        field(90; "End Date"; Date)
        {
            Caption = 'End  Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "End Date" <= "Start Date" then begin
                    "Use Car Days" := 0;
                    Message('error')
                end
                else
                    UseCarDays();
            end;

        }
        field(100; "Use Car Days"; Integer)
        {
            Caption = 'Use Car Days';
            DataClassification = CustomerContent;
            Editable = false;
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
        key(PK; "Line No.", "My Line No.")
        {
            Clustered = true;
        }
    }
    local procedure UseCarDays()
    begin
        "Use Car Days" := ("End Date" - "Start Date");
    end;

}

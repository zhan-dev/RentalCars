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
            TableRelation = Item."No." where(Type = const(Rental));

            //скидка
            // trigger OnValidate()
            // begin
            //     SetDiscount();
            // end;
        }
        field(30; "RCars Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            TableRelation = Item."RCars Name" where(Type = const(Rental)); //уточнение фильтра
            ValidateTableRelation = false; //нужно уточнить
        }
        field(40; "RCars Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            // TableRelation = Item;
        }
        field(50; "RCars Car Model"; Text[20])
        {
            Caption = 'Car Model';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Car Model";
            ValidateTableRelation = false;
        }
        field(60; "RCars Car Color"; Text[50])
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Car Color";
            ValidateTableRelation = false;
        }
        field(70; "RCars Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Year";
            ValidateTableRelation = false;
        }
        field(80; "RCars Was Crash"; Text[50])
        {
            Caption = 'Was Crashed';
            DataClassification = CustomerContent;
            TableRelation = item."RCars Was Crash";
            ValidateTableRelation = false;
        }
        field(90; "Start Date"; Date)
        {
            Caption = 'Start  Date';
            DataClassification = CustomerContent;
        }
        field(100; "End Date"; Date)
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
        field(110; "Use Car Days"; Integer)
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

    //разница дат для заказа
    local procedure UseCarDays()
    begin
        "Use Car Days" := ("End Date" - "Start Date");
    end;


    //процедура добавления скидки
    local procedure SetDiscount()
    var
        Item: Record Item;
    begin
        if Rec."Item No." <> '' then
            Item.get();

        Rec."RCars Discount" := Item."RCars Discount";
    end;

}

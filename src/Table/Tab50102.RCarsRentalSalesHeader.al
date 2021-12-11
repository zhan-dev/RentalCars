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
        }
        field(20; "Salesperson No."; Code[20])
        {
            Caption = 'Salesperson No.';
            DataClassification = CustomerContent;
        }
        field(30; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Doc. No.")
        {
            Clustered = true;
        }
    }

    //процедура на удаление записи из таблицы заказа, и связанной с ней таблицы одновременно
    trigger OnDelete()
    var
        RCarsRentalCarsMgt: Codeunit "RCars Rental Cars Mgt.";
    begin
        RCarsRentalCarsMgt.DeleteRCarsRentalSalesLine(Rec."Doc. No.");
    end;

}

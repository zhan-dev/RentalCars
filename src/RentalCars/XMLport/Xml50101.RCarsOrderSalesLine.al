xmlport 50101 "RCars Order Sales Line"
{
    Caption = 'Order Sales Line';
    FormatEvaluate = Xml; //формат, в котором работает
    Encoding = UTF8;
    // Direction = Export;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(RCarsRentalSalesLine; "RCars Sales Line")
            {
                fieldelement(LineNo; RCarsRentalSalesLine."Line Doc No.")
                {
                }
                fieldelement(ItemNo; RCarsRentalSalesLine."Item No.")
                {
                }
                fieldelement(RCarsName; RCarsRentalSalesLine."RCars Name")
                {
                }
                fieldelement(RCarsCarModel; RCarsRentalSalesLine."RCars Car Model")
                {
                }
                fieldelement(RCarsCarColor; RCarsRentalSalesLine."RCars Car Color")
                {
                }
                fieldelement(RCarsYear; RCarsRentalSalesLine."RCars Year")
                {
                }
                fieldelement(StartDate; RCarsRentalSalesLine."Start Date")
                {
                }
                fieldelement(EndDate; RCarsRentalSalesLine."End Date")
                {
                }
                fieldelement(ServiceDay; RCarsRentalSalesLine."Service Day")
                {
                }
                fieldelement(UseCarDays; RCarsRentalSalesLine."Use Car Days")
                {
                }
                fieldelement(RCarsDiscount; RCarsRentalSalesLine."RCars Discount")
                {
                }
            }
        }
    }
}

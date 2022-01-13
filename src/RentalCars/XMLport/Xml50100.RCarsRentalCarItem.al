xmlport 50100 "RCars RentalCarItem"
{
    Caption = 'RentalCarItem';
    FormatEvaluate = Xml; //формат, в котором работает
    Encoding = UTF8;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Item; Item)
            {
                fieldelement(No; Item."No.")
                {
                }
                fieldelement(RCarsName; Item."RCars Name")
                {
                }
                fieldelement(RCarsCarColor; Item."RCars Car Color")
                {
                }
                fieldelement(RCarsCarModel; Item."RCars Car Model")
                {
                }
                fieldelement(RCarsYear; Item."RCars Year")
                {
                }
                fieldelement(RCarsWasCrash; Item."RCars Was Crash")
                {
                }
                fieldelement(RCarsDiscount; Item."RCars Discount")
                {
                }
            }
        }
    }
}

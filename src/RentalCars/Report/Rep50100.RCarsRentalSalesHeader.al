report 50100 "RCars Rental Sales Header"
{
    ApplicationArea = All;
    Caption = 'Rental Sales Header';
    UsageCategory = ReportsAndAnalysis;

    WordLayout = 'src\RentalCars\Layout\RentalCars.docx';
    RDLCLayout = 'src\RentalCars\Layout\RentalCars.RDLC';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(RCarsRentalSalesHeader; "RCars Rental Sales Header")
        {
            column(CustomerNo; "Customer No.")
            {

            }
            column(DocNo; "Doc. No.")
            {
            }
            column(SalespersonNo; "Salesperson No.")
            {
            }
        }
        dataitem(RCarsRentalSalesLine; "RCars Rental Sales Line")
        {
            column(LineNo; "Line Doc No.")
            {

            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}

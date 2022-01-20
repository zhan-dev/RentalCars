report 50100 "RCars Sales Header"
{
    ApplicationArea = All;
    Caption = 'Sales Header';
    UsageCategory = ReportsAndAnalysis;

    WordLayout = 'src\RentalCars\Layout\RentalCars.docx';
    RDLCLayout = 'src\RentalCars\Layout\RentalCars.RDLC';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(RCarsRentalSalesHeader; "RCars Sales Header")
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
        dataitem(RCarsRentalSalesLine; "RCars Sales Line")
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

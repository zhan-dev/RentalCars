report 50100 "RCars Sales Order"
{
    ApplicationArea = All;
    Caption = 'Sales Order';
    UsageCategory = ReportsAndAnalysis;

    WordLayout = 'src\RentalCars\Layout\RentalCars.docx';
    RDLCLayout = 'src\RentalCars\Layout\RCarsSalesOrder.RDLC';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(RCarsSalesHeader; "RCars Sales Header")
        {
            RequestFilterFields = "Doc. No.", "Salesperson No."; //фильтр

            column(DocNo_RCarsSalesHeader; "Doc. No.")
            {
                IncludeCaption = true;
            }
            column(SalespersonNo_RCarsSalesHeader; "Salesperson No.")
            {
                IncludeCaption = true;
            }
            column(SalespersonName_RCarsSalesHeader; "Salesperson Name")
            {
                IncludeCaption = true;
            }
            column(SalespersonEMail_RCarsSalesHeader; "Salesperson E-Mail")
            {
                IncludeCaption = true;
            }
            column(CustomerNo_RCarsSalesHeader; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(CustomerName_RCarsSalesHeader; "Customer Name")
            {
                IncludeCaption = true;
            }
            column(CustomerAddress_RCarsSalesHeader; "Customer Address")
            {
                IncludeCaption = true;
            }
            column(Discount_RCarsSalesHeader; Discount)
            {
                IncludeCaption = true;
            }
            column(OrderDate_RCarsSalesHeader; "Order Date")
            {
                IncludeCaption = true;
            }
        }
        dataitem(RCarsSalesLine; "RCars Sales Line")
        {
            column(LineNo; "Line Doc No.")
            {
                IncludeCaption = true;
            }
            column(RCarsName_RCarsSalesLine; "RCars Name")
            {
                IncludeCaption = true;
            }
            column(RCarsCarModel_RCarsSalesLine; "RCars Car Model")
            {
                IncludeCaption = true;
            }
            column(RCarsCarColor_RCarsSalesLine; "RCars Car Color")
            {
                IncludeCaption = true;
            }
            column(RCarsYear_RCarsSalesLine; "RCars Year")
            {
                IncludeCaption = true;
            }
            column(RCarsWasCrash_RCarsSalesLine; "RCars Was Crash")
            {
                IncludeCaption = true;
            }
            column(StartDate_RCarsSalesLine; "Start Date")
            {
                IncludeCaption = true;
            }
            column(EndDate_RCarsSalesLine; "End Date")
            {
                IncludeCaption = true;
            }
            column(ServiceDay_RCarsSalesLine; "Service Day")
            {
                IncludeCaption = true;
            }
        }
    }
    requestpage
    {
        SaveValues = true; //сохранение настроек фильтров
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowSalesLines; ShowSalesLines)
                    {
                        ApplicationArea = Reservation;
                        Caption = 'Show Sales Lines';
                        ToolTip = 'Specifies if you want the report to include a line for each sales line. If you do not place a check mark in the check box, the report will include one line for each document.';

                        // trigger OnValidate()
                        // begin
                        //     if not ShowSalesLines then
                        //         ShowReservationEntries := false;
                        // end;
                    }
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
    var
        ShowSalesLines: Boolean;
}

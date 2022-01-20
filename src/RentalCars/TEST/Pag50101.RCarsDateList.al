page 50101 "RCars DateList"
{
    ApplicationArea = All;
    Caption = 'DateListL';
    PageType = List;
    SourceTable = "RCars Date Test";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field("Date Formula"; Rec."Date Formula")
                {
                    ToolTip = 'Specifies the value of the Date Formula field.';
                    ApplicationArea = All;
                }
                field("Refarence for  date calc"; Rec."Refarence for  date calc")
                {
                    ToolTip = 'Specifies the value of the Refarence for  date calc field.';
                    ApplicationArea = All;
                }
                field("Date Result"; Rec."Date Result")
                {
                    ToolTip = 'Specifies the value of the Date Result field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}

namespace com.sap.learning;

entity Employees {  
                key EmployeeId     : Integer;
                    EmployeeRole   : String(20);
                    First_Name     : String(15);
                    Last_name      : String(15);
                    Full_name      : String(30);
                    DOB            : Date;
                    DOJ            : Date;
                    Salary_details : Association to Salary_details  } 
    

entity Salary_details { Package      : CTC;
                        PF           : Double }

type CTC { Fixed_pay     : Double;
           Variable_pay  : Double;
           Total_Package : Double };
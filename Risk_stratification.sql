-- Create database healthcare

Create Database healthcare;
use healthcare;

-- create table 

Create Table Diagnoses(
DiagnosisID INT PRIMARY KEY,
DiagnosisName Varchar(255)
);

 Create table Outcomes(
OutcomeID INT PRIMARY KEY,
OutcomeName Varchar(255)
);

Create table Patients(
PatientID INT PRIMARY KEY,
Name Varchar(255),
Age INT,
Gender char (1),
DiagnosisID INT,
AdmissionDate Date,
DischargeDate Date,
OutcomeID Int,
TreatmentCost Decimal(10,2),
foreign key (DiagnosisID) References Diagnoses(DiagnosisID),
foreign Key (OutcomeId) References Outcomes(OutcomeID)
);

Create table Labs(
LabID INT PRIMARY KEY,
PatientID INT,
TestName Varchar(255),
Result Decimal(10,2),
NormalRange Varchar(255),
foreign key (PatientID) references Patients(PatientID)
);

select * from Patients;
select * from Diagnoses;
select * from Outcomes;
Select * from Labs;

-- Retrive Detailed Patient Lab History

select  p.patientID, p.name, d.diagnosisname, o.outcomeName, l.testname, l.result, l.normalrange
from Patients p
Join Diagnoses d on p.diagnosisID = d.diagnosisID
Join Outcomes o on p.outcomeid = o.outcomeid
Join Labs l on p.patientid = l.patientid
order by p.patientid , l.testname; 

-- Average Lab result by Diagnosis
select d.diagnosisname, l.testname, avg(l.result) as AvgResult
from Patients p
join Diagnoses d on p.diagnosisID = d.diagnosisID
Join Labs l on p.patientID = l.patientID
group by d.diagnosisname, l.testname;

-- Count of Abnormal lab result

select p.patientID, p.name , count(*) as Abnormalcount
from Patients p
join labs l on p.patientID = l.patientID
where (l.testname = 'Blood Sugar' and l.result > 120) or
(l.testname = 'Hemoglobin' and l.result < 13) or
(l.testname = 'Cholesterol' and l.result > 200) 
group by p.patientID , p.name
order by Abnormalcount desc;

-- Diagnosis by higheest treament cost

select d.diagnosisname , sum(p.treatmentcost) as Totalcost
from Patients p 
join Diagnoses d on p.diagnosisid = d.diagnosisid
group by d.diagnosisname 
order by Totalcost desc;

-- Patients at Risk by Age and Gender
select p.patientid, p.name, p.age, d.diagnosisname, o.outcomename 
from Patients p
join Diagnoses d on p.diagnosisid = d.diagnosisid
join Outcomes o on p.outcomeid = o.outcomeid
where p.age > 65 and o.outcomename != 'Recovered';

-- Distribution of outcome by Diagnoses

select d.diagnosisname , o.outcomename , count(*) as Outcomecount
from Patients p
join Diagnoses d on p.diagnosisid = d.diagnosisid
join Outcomes o on p.outcomeid = o.outcomeid
group by d.diagnosisname, o.outcomename
order by d.diagnosisname, o.outcomename;






Use [UGTU_ACTTEST] 
--drop  Table dbo.Addressee_Doc
--drop table dbo.Work_Person 
--drop table dbo.Work
--drop table dbo.Visa_Destination
--drop table dbo.CallSpr
--drop table dbo.DocumentBase
--drop table dbo.Document
--drop table dbo.Base_Destination
--drop table dbo.Destination
--drop table dbo.TransferMethod
--drop table ReasonCall

--метод передачи документа
Create Table dbo.TransferMethod(
Ik_Transfer int identity (1,1) not null
Constraint PrimaryKeyTrans primary key,
cNameTransfer varchar(50) not null);

--назначение для справочника
Create Table dbo.Destination( 
Ik_destination int identity (1,1) not null
Constraint PrimaryKeyDestination primary key,
cNameDestination varchar(50) not null,
cShortNameDestination varchar(50) not null,
Ik_TypeDest int null,
CONSTRAINT FK_Destination_TipeDest FOREIGN KEY(Ik_TypeDest) REFERENCES [dbo].TypeDest(Ik_TypeDest));

--основание-назначение для справочника
Create Table dbo.Base_Destination(
Ik_destination1 int not null, 
Ik_destination2 int not null,
CONSTRAINT Base_Destination_Destination_FK1 FOREIGN KEY(Ik_destination1) REFERENCES Destination(Ik_destination),
CONSTRAINT Base_Destination_Destination_FK2 FOREIGN KEY(Ik_destination2) REFERENCES Destination(Ik_destination));

Create Table dbo.ReasonIssuing( --причина выдачи
Ik_reason_issuing int identity (1,1) not null
Constraint PrimaryKey_ReasonIssuing primary key,
ik_pric int not null,
ik_destinatoin int not null,
CONSTRAINT FK_ReasonIssuing_Pricina FOREIGN KEY(ik_pric) REFERENCES [dbo].[Pricina](ik_pric),
CONSTRAINT FK_ReasonIssuing_Destination  FOREIGN KEY(ik_destinatoin) REFERENCES [dbo].[Destination]([Ik_destination]),
);

--документ
Create Table dbo.Document(
Ik_Document int identity (1,1) not null
Constraint PrimaryKeyDoc primary key,
Ik_Transfer int not null,
Ik_destination int not null,
Ik_studGrup int not null,
NumberDoc varchar(50) not null,
Ik_reason_issuing int null,
CONSTRAINT Document_Transfer_FK FOREIGN KEY(Ik_Transfer) REFERENCES TransferMethod(Ik_Transfer),
CONSTRAINT Document_Destination_FK FOREIGN KEY(Ik_destination) REFERENCES Destination(Ik_destination),
CONSTRAINT Document_StudGrup_FK FOREIGN KEY(Ik_studGrup) REFERENCES StudGrup(Ik_studGrup),
CONSTRAINT Document_ReasonIssuing_FK FOREIGN KEY(Ik_reason_issuing) REFERENCES ReasonIssuing(Ik_reason_issuing),
DateCreate DateTime, 
DatePrint DateTime);


--основание документа
Create Table dbo.DocumentBase(
Ik_Document_base int not null,--основание 
Ik_Document_reference int not null, -- документ  которому требуется основание
CONSTRAINT DocumentBase_Document_FK1 FOREIGN KEY(Ik_Document_base) REFERENCES Document(Ik_Document),
CONSTRAINT DocumentBase_Document_FK2 FOREIGN KEY(Ik_Document_reference) REFERENCES Document(Ik_Document));



--справка вызов
Create Table dbo.CallSpr(
--Ik_CallSpr int identity (1,1) not null
Ik_Document int not null 
Constraint PrimaryKeyCallSpr primary key,
Ik_upContent int not null,
CONSTRAINT CallSpr_Document_FK FOREIGN KEY(Ik_Document) REFERENCES Document(Ik_Document),
CONSTRAINT CallSpr_Content_UchPl_FK FOREIGN KEY(Ik_upContent) REFERENCES Content_UchPl(Ik_upContent),
DateStartPeriod Date not null,
DateEndPeriod Date not null,
DateAppearanceStudent Date null);


--визы назначения
Create Table dbo.Visa_Destination(
Ik_Visa_Destination int identity (1,1) not null
Constraint PrimaryKeyVisa_Destination primary key,
Ik_destination int not null, 
numberPost int not null,
isLocation bit not null,
CONSTRAINT Destination_Visa_FK FOREIGN KEY(Ik_destination) REFERENCES Destination(Ik_destination));


----Место работы
--Create Table dbo.Work(
--Ik_Work int identity (1,1) not null
--Constraint PrimaryKey_Work primary key,
--Ik_address int not null,
--CONSTRAINT Work_Adress_FK FOREIGN KEY(Ik_address) REFERENCES Address(Ik_address), 
--Cname_work varchar(100) not null,
--NCode varchar(50) not null,
--nOGRN varchar(100) not null,
--cFIO_chief varchar(100) not null);


----Место работы_персона
--Create Table dbo.Work_Person(
--Ik_Work_Person int identity (1,1) not null
--Constraint PrimaryKey_Work_Person primary key,
--NCode numeric not null,  
--Ik_Work int not null
--CONSTRAINT Work_Person_FK FOREIGN KEY(NCode) REFERENCES Person(NCode),
--CONSTRAINT Work_Person_Work_FK FOREIGN KEY(Ik_Work) REFERENCES Work(Ik_Work),
--Ddate_Begin Date not null,
--Ddate_End Date not null);


Create Table dbo.Addressee_Doc(
Ik_addressee int identity (1,1) not null
Constraint PrimaryKey_Addressee_Doc_Document primary key,
Ik_Document int not null,
[ik_personAddress] int not null,
CONSTRAINT FK_Addressee_Doc_Document FOREIGN KEY(Ik_Document) REFERENCES Document(Ik_Document),
CONSTRAINT FK_Addressee_Doc_PersonAddress FOREIGN KEY([ik_personAddress]) REFERENCES PersonAddress([ik_personAddress]),
);


--------------------------------
Create Table dbo.nWeek(
Ik_num_week int identity (1,1) not null
Constraint PrimaryKey_Num_Week primary key,
Num1 int not null,
Num2 int not null,
ik_upContent int not null,
mask_week1 char(6) DEFAULT '111111' not null,
mask_week2 char(6) DEFAULT '111111' not null,
CONSTRAINT FK_Num_week_Content_UchPl FOREIGN KEY(ik_upContent) REFERENCES [dbo].[Content_UchPl](ik_upContent)
);

-----------------------------------




--ALTER TABLE Document
--ADD CONSTRAINT Document_ReasonIssuing_FK FOREIGN KEY(Ik_reason_issuing) REFERENCES ReasonIssuing(Ik_reason_issuing)



Create Table dbo.AkademNeuspev(
Ik_Document int not null
Constraint PrimaryKey_AkademNeuspev primary key,
Deduction date not null,
NamePric varchar(max) not null,
CONSTRAINT FK_AkademNeuspev_Document FOREIGN KEY(Ik_Document) REFERENCES [dbo].Document(Ik_Document)
);

Create Table dbo.Debt(
Ik_Document int not null,
Ik_upContent int not null,
Constraint PrimaryKey_Debt primary key (Ik_Document,Ik_upContent) ,
CONSTRAINT FK_AkademNeuspev_Debt FOREIGN KEY(Ik_Document) REFERENCES [dbo].AkademNeuspev(Ik_Document),
CONSTRAINT Debt_Content_UchPl_FK FOREIGN KEY(Ik_upContent) REFERENCES Content_UchPl(Ik_upContent),
);
-- таблица для указания начала номерации документов
Create Table dbo.BeginNumDoc (
Ik_beginNumDoc int identity (1,1) not null
Constraint PrimaryKeyBeginNumDoc primary key,
YearD int not null,
Ik_room int  null,
Ik_TypeDest int  not null,
Num int not null,
CONSTRAINT FK_BeginNumDoc_TypeDest FOREIGN KEY(Ik_TypeDest) REFERENCES [dbo].TypeDest(Ik_TypeDest),
CONSTRAINT BeginNumDoc_Room FOREIGN KEY(Ik_room) REFERENCES Room(Ik_room)
);

Create Table dbo.TypeDest (
Ik_TypeDest int identity (1,1) not null
Constraint PrimaryKeyTypeDest primary key,
NumType int not null
);
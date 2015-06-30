
Use [UGTU_ACTTEST]

INSERT INTO dbo.StatusDoc
  VALUES ('На рассмотрении');
 INSERT INTO dbo.StatusDoc
  VALUES ('Готово')
 INSERT INTO dbo.StatusDoc
  VALUES ('Выдано');


INSERT INTO dbo.Destination
   VALUES ('Справка по месту  требования','Справка по месту  требования');
INSERT INTO dbo.Destination
   VALUES ('Справка в пенсионный фонд','ПФ');
INSERT INTO dbo.Destination
   VALUES ('Справка-вызов','Справка-вызов');
INSERT INTO dbo.Destination
   VALUES ('Заявление на академическую справку','Заявление на академ. спр.');
INSERT INTO dbo.Destination
   VALUES ('Письмо-уведомление о сроках сессии','Письмо-уведомление');
INSERT INTO dbo.Destination
   VALUES ('Письмо об академической неуспеваемости','Академ. неуспеваемость');
INSERT INTO dbo.Destination
   VALUES ('Академическая справка','Академ. справка');


INSERT INTO dbo.Base_Destination
	VALUES (7,4);


INSERT INTO dbo.Visa_Destination
	VALUES (3,649,1);
INSERT INTO dbo.Visa_Destination
	VALUES (2,649,1);
INSERT INTO dbo.Visa_Destination
	VALUES (4,649,1);
INSERT INTO dbo.Visa_Destination
	VALUES (7,649,1);
INSERT INTO dbo.Visa_Destination
	VALUES (2,228,0);
INSERT INTO dbo.Visa_Destination
	VALUES (1,228,0);
INSERT INTO dbo.Visa_Destination
	VALUES (4,228,0);
INSERT INTO dbo.Visa_Destination
	VALUES (7,228,0);


INSERT INTO dbo.TransferMethod
	VALUES ('На руки');
INSERT INTO dbo.TransferMethod
	VALUES ('По почте');
INSERT INTO dbo.TransferMethod
	VALUES ('По e-mail');


INSERT INTO dbo.Document
	VALUES (3,1,20448,'2015-03-04 00:00:00');
INSERT INTO dbo.Document
	VALUES (1,2,20436,'2015-03-04 00:00:00');


INSERT INTO dbo.StatusDoc_Document
	VALUES (1,7,'2015-03-04');
INSERT INTO dbo.StatusDoc_Document
	VALUES (2,7,'2015-03-05');
INSERT INTO dbo.StatusDoc_Document
	VALUES (1,8,'2015-03-04');


INSERT INTO dbo.Base_Destination
	VALUES (7,4);


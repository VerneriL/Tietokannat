-- LISÄTÄÄN TESTIASIAKKAAT ASIAKAS-TAULUUN

USE Vuokraus
GO

INSERT INTO asiakas (yritys,laskutusosoite,postinumero,postitoimipaikka) VALUES
	 ('Raseko','Purokatu 1','21200','Raisio'),
	 ('Mähönen Oy','Kuormakatu 2','21200','Raisio'),
	 ('Autoliike Petos & Vilppi Ky','Keskuskatu 22','23100','Mynämäki'),
	 ('Huttu ja keitto Ay','Puoskarinkatu 2 A 11','20100','Turku');
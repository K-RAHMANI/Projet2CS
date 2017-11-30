


--Database: `projet_ONAAPH`



DROP TABLE IF EXISTS `Patient`;
CREATE TABLE IF NOT EXISTS `Patient` (
   `ID_Patient`			 smallint(6) NOT NULL,
   `Photo_patient` 				 varchar(20) ,
   `Nom_patient` 				 varchar(20) NOT NULL,
   `Prenom_patient` 			 varchar(20) NOT NULL,
   `Date_Naissance_patient` 	 date NOT NULL,
   `Adresse` 			 varchar(20) NOT NULL,
   `Commune` 			 varchar(20) NOT NULL,
   `Wilaya` 			 varchar(20) NOT NULL,
   `Telephone1` 		 varchar(15) NOT NULL,
   `Telephone2` 		 varchar(15) NOT NULL,
   `Email` 				 varchar(20) NOT NULL,
   `Nom_Proche` 		 varchar(20) NOT NULL,
   `Prenom_Proche` 		 varchar(20) NOT NULL,
   `Email_Proche` 		 varchar(20) NOT NULL,
   `Telephoen1_Proche`   varchar(20) NOT NULL,
   `Telephoen2_Proche`   varchar(20) NOT NULL,
   `Raltion_Patient`     varchar(20) NOT NULL,

  PRIMARY KEY (`ID_Patient`)
  
) ;



DROP TABLE IF EXISTS `Medecin`;
CREATE TABLE IF NOT EXISTS `Medecin` (
   `ID_Medecin`			 smallint(6) NOT NULL,
   `Photo_medecin` 				 varchar(20) NOT NULL,
   `Nom_medecin` 				 varchar(20) NOT NULL,
   `Prenom_medecin` 			 varchar(20) NOT NULL,
   `Date_Naissance_medecin` 	 date NOT NULL,
   `Adresse` 			 varchar(20) NOT NULL,
   `Telephone1` 		 varchar(15) NOT NULL,
   `Telephone2` 		 varchar(15) NOT NULL,
   `Email` 				 varchar(20) NOT NULL,
  
   

  PRIMARY KEY (`ID_Medecin`)
  
);





DROP TABLE IF EXISTS `Stoma`;
CREATE TABLE IF NOT EXISTS `Stoma` (
   `ID_Stoma`			 smallint(6) NOT NULL,
   `Photo_stoma` 				 varchar(20) NOT NULL,
   `Nom_stoma` 				 varchar(20) NOT NULL,
   `Prenom_stoma` 			 varchar(20) NOT NULL,
   `Date_Naissance_stoma` 	 date NOT NULL,
   `Adresse` 			 varchar(20) NOT NULL,
   `Telephone1` 		 varchar(15) NOT NULL,
   `Telephone2` 		 varchar(15) NOT NULL,
   `Email` 				 varchar(20) NOT NULL,
  
   

  PRIMARY KEY (`ID_Stoma`)
  
) ;


DROP TABLE IF EXISTS `Assistant`;
CREATE TABLE IF NOT EXISTS `Assistant` (
   `ID_Assistant`			 smallint(6) NOT NULL,
   `Photo_assistant` 				 varchar(20) NOT NULL,
   `Nom_assistant` 				 varchar(20) NOT NULL,
   `Prenom_assistant` 			 varchar(20) NOT NULL,
   `Date_Naissance` 	 date NOT NULL,
   `Adresse` 			 varchar(20) NOT NULL,
   `Telephone1` 		 varchar(15) NOT NULL,
   `Telephone2` 		 varchar(15) NOT NULL,
   `Email` 				 varchar(20) NOT NULL,
  
   

  PRIMARY KEY (`ID_Assistant`)
  
);



DROP TABLE IF EXISTS `Examen`;
CREATE TABLE IF NOT EXISTS `Examen` (
   `ID_Examen`      smallint(6) NOT NULL,
   `Medecin`         varchar(20) NOT NULL,
   `Patient`         varchar(20) NOT NULL,
   `Date_Examen`    date NOT NULL,
   `Type_Examen`       varchar(20) NOT NULL,
   `Poids`      varchar(15) NOT NULL,
   `Taille`      varchar(15) NOT NULL,
   `Pointure`         varchar(20) NOT NULL,
  
   
  PRIMARY KEY (`ID_Examen`),
  FOREIGN KEY (`Medecin`) references Medecin (`ID_Medecin`),
  FOREIGN KEY (`Patient`) references Patient (`ID_Patient`)
  
);



DROP TABLE IF EXISTS `Produit`;
CREATE TABLE IF NOT EXISTS `Produit` (
   `ID_Produit`      smallint(10) NOT NULL,
   `Code_Produit`         varchar(20) NOT NULL,
   `Designation`         varchar(50) NOT NULL,


  PRIMARY KEY (`ID_Produit`)
  
);




DROP TABLE IF EXISTS `Examen_Produit`;
CREATE TABLE IF NOT EXISTS `Examen_Produit` (
   `ID_Examen_Produit`      smallint(10) NOT NULL,
   `Produit`                smallint(10) NOT NULL,
   `Examen`                 smallint(10) NOT NULL,
 


  PRIMARY KEY (`ID_Examen_Produit`),
  FOREIGN KEY (`Produit`) references Produit(`ID_Produit`),
  FOREIGN KEY (`Examen`) references Examen(`ID_Examen`)
  
);




DROP TABLE IF EXISTS `DemandeAssistance`;
CREATE TABLE IF NOT EXISTS `DemandeAssistance` (
   `ID_Demande_ass`	     smallint(6) NOT NULL,
   `Patient` 		     smallint(6) NOT NULL,
   `Type_Assistance` 	 varchar(20) NOT NULL,
   `Motif_Assistance` 	 varchar(200) NOT NULL,
   `Date_Assistance` 	 date NOT NULL,
   
  
   

  PRIMARY KEY (`ID_Demande_ass`),
  FOREIGN KEY (`Patient`) references Patient(`ID_Patient`)
  
) ;




DROP TABLE IF EXISTS `Document`;
CREATE TABLE IF NOT EXISTS `Document` (
   `ID_Document`     smallint(6) NOT NULL,
   `Patient`         smallint(6) NOT NULL,
   `Type_doc`        varchar(20) NOT NULL,
   `Dat_depote`      date NOT NULL,
   `URL`             varchar(20) NOT NULL,
   
  
   

  PRIMARY KEY (`ID_Document`),
  FOREIGN KEY (`Patient`) references Patient(`ID_Patient`)
  
) ;






DROP TABLE IF EXISTS `FilAttente`;
CREATE TABLE IF NOT EXISTS `FilAttente` (

  `ID_Fil`  int(11) NOT NULL,
  `Patient`       smallint(6) NOT NULL,
  `Date` 		  date NOT NULL,
  

  PRIMARY KEY (`ID_Fil`),
  FOREIGN KEY (`Patient`) references Patient(`ID_Patient`)
  
) ;


 


INSERT INTO `Patient` (`ID_Patient`, `Photo_patient`, `Nom_patient`, `Prenom_patient`, `Date_Naissance_patient`, `Adresse`, `Commune`, `Wilaya`, `Telephone1`, `Telephone2`, `Email`, `Nom_Proche`, `Prenom_Proche`, `Email_Proche`, `Telephoen1_Proche`, `Telephoen2_Proche`, `Raltion_Patient`) VALUES

('1', ' ' , 'Ait ouaret', 'Sofiane','1995-05-05', 'Sidi Aich', 'Bejaia', 'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz', 'Dahmani','Dahmani','ds_maiza@esi.dz','0665050320','0665050320','Cousin'),
('2', ' ' , 'Ait ouaret', 'Sofiane','1995-05-05', 'Sidi Aich', 'Bejaia', 'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz', 'Dahmani','Dahmani','ds_maiza@esi.dz','0665050320','0665050320','Cousin'),
('3', ' ' , 'Ait ouaret', 'Sofiane','1995-05-05', 'Sidi Aich', 'Bejaia', 'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz', 'Dahmani','Dahmani','ds_maiza@esi.dz','0665050320','0665050320','Cousin');




INSERT INTO `Medecin` (`ID_Medecin`, `Photo_medecin`, `Nom_medecin`, `Prenom_medecin`, `Date_Naissance_medecin`, `Adresse`, `Telephone1`, `Telephone2`, `Email`) VALUES 
('1', ' ' ,'Maiza', 'Islem','1995-05-05',  'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz' ),
('2', ' ' ,'Maiza', 'Islem','1995-05-05',  'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz' ),
('3', ' ','Maiza', 'Islem','1995-05-05',  'bejaia', '0665050320', '0665050320', 'ds_maiza@esi.dz' );


  

INSERT INTO `Examen` (`ID_Examen`, `Medecin`, `Patient`, `Date_Examen`, `Type_Examen`, `Poids`, `Taille`, `Pointure`) VALUES

('1', '1', '1', '1995-05-05', 'type1', '80', '180', '42' ),
('2', '1', '1', '1995-05-05', 'type1', '80', '180', '42' ),
('3', '1', '1', '1995-05-05', 'type1', '80', '180', '42' );
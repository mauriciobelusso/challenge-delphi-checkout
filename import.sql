DELETE FROM CUSTOMERS;

COMMIT;

INSERT INTO CUSTOMERS (name,city,uf)
VALUES
  ("Kevin Bowen","Randburg","PA"),
  ("Jack Dillard","Mataram","MG"),
  ("Cynthia Trevino","Medemblik","GO"),
  ("Paloma Thomas","İmamoğlu","MA"),
  ("Lee Adkins","Wonju","SC"),
  ("Perry Blankenship","Heusden","PB"),
  ("Clark Harris","Cabadbaran","MA"),
  ("Holly Terrell","Devonport","RJ"),
  ("Rashad Mcconnell","Imphal","PB"),
  ("Raja Luna","Oviedo","PA"),
  ("Kai Dillon","Farsund","BA"),
  ("Hakeem Garcia","Voronezh","SP"),
  ("Flavia Slater","Quesada","PA"),
  ("Guy Ingram","Nurdağı","RS"),
  ("Carol Burke","Piotrków Trybunalski","PA"),
  ("Idola Abbott","Sobral","BA"),
  ("Hope Martin","Zhytomyr","MA"),
  ("Barrett Bartlett","Denpasar","GO"),
  ("Alisa Bradley","Ongole","PA"),
  ("Basil Herman","Tehuacán","PR");

COMMIT; 

DELETE FROM PRODUCTS; 

COMMIT;

INSERT INTO PRODUCTS (description,sale_price)
VALUES
  ("Jacqueline","26.50"),
  ("Molly","71.33"),
  ("Dean","77.55"),
  ("Ronan","29.40"),
  ("Lynn","26.50"),
  ("Carla","71.50"),
  ("Ariel","11.48"),
  ("Randall","1.01"),
  ("Quyn","94.85"),
  ("Aurora","42.81"),
  ("Charde","25.83"),
  ("Alfreda","98.31"),
  ("Michelle","53.90"),
  ("Keefe","41.71"),
  ("Shad","27.41"),
  ("Deirdre","50.43"),
  ("Amos","53.39"),
  ("Zia","59.49"),
  ("Justine","92.42"),
  ("Jemima","66.87");

COMMIT;
--Ajout de données table : client--

INSERT INTO client
	(nom, prenom, telephone, e_mail)
VALUES
	('LONGUET', 'Rodolphe', '0612345678', 'rodolphe.longuet@gmail.com'),
	('LASSALE', 'Charlotte', '0142653617', 'c.lassale@gmail.com'),
	('METROT', 'Charles', '0672123478', 'charles77@hotmail.com'),
	('AKCHOUR', 'Karim', '0623456789', 'Krim@orange.fr'),
	('DUPOND', 'François', '0656123456', 'fifidu13@gmail.com'),
	('RIZANAJ', 'Mentor', '0160676413', 'Mentor.R@outlook.fr'),
	('CROCHET', 'Sarah', '0612347780', 'sarahcroche@gmail.com'),
	('OGUNDELE', 'Christianna', '0760123477', 'Ogundele27@gmail.com'),
	('DUBOIS', 'Mélanie', '0612345690', 'Mel.Dubois@gmail.com'),
	('AICHOUN', 'Chérif', '0612234321', 'chérif@aichoun.com')
;

--Ajout de données table : adresse--

INSERT INTO adresse
	(destinataire, numero_voie, voie, complement_voie, code_postal, localite, client_id)
VALUES
	('LONGUET Rodolphe', 23, 'rue des Bordes', 'bis', 77160, 'Provins', 1),
	('LASSALE Charlotte',17, 'rue Palaiso', NULL, 77171, 'Sourdun', 2),
	('METROT Charles', 6, 'chemin du prés', NULL, 77160, 'Provins', 3),
	('AKCHOUR Karim', 18, 'rue de Jique', 'ter', 77160, 'Provins', 4),
	('DUPOND François', 132, 'avenue du Général', 'bis', 77160, 'Provins', 5),
	('RIZANAJ Mentor', 3, 'sentier des Anges', NULL, 77650, 'Le MEZ de la Madeleine', 6),
	('Gare SNCF de Provins', 1, 'place de la gare', NULL, 77160, 'Provins', 6 ),
	('CROCHET Sarah', 42, 'route de Paris', '', 77159, 'Saint-Brice', 7),
	('OGUNDELE Christianna', 77, 'boulevard Gabin', NULL, 77160, 'Provins', 8),
	('DUBOIS Mélanie', 18, 'rue des pisenlits', NULL, 77560, 'Beauchery-Saint-Martin', 9),
	('AICHOUN Chérif', 24, 'rue de Barclay', NULL, 77160, 'Provins', 10),
	('Boucherie Bouchard', 7, 'rue de la haie basse', NULL, 77108, 'Everly', 6)
;

--Ajout de données table : adresse_facturation--

INSERT INTO adresse_facturation
	(date, client_id, adresse_id)
VALUES
	('2019-04-01 10:23:54', 1, 1),
	('2019-04-01 11:28:14', 6, 6),
	('2019-04-01 21:23:01', 2, 2),
	('2019-04-02 12:14:33', 3, 3),
	('2019-04-02 11:25:05', 5, 5),
	('2019-04-02 12:34:47', 6, 6),
	('2019-04-02 20:02:57', 7, 7),
	('2019-04-02 21:51:15', 10, 10),
	('2019-04-03 11:16:59', 8, 8),
	('2019-04-03 12:03:38', 9, 9),
	('2019-04-03 11:48:24', 6, 6)
;


--Ajout de données table : chef_cuisinier--

INSERT INTO chef_cuisinier
	(nom, prenom, telephone, e_mail)
VALUES
	('RICHARD', 'Pierre', 0615345678, 'P.Richard@ExpressFood.com'),
	('LELO', 'Anthony', 0128653617, 'A.Lelo@ExpressFood.com'),
	('CALLU', 'Véronique', 0673323418, 'V.Callu@ExpressFood.com'),
	('BASSARA', 'Allassan', 0689456789, 'A.Bassara@ExpressFood')
;


--Ajout de données table : plat--

INSERT INTO plat
	(reference, nom, descriptif, prix_unitaire_ttc, quantite, date_fabrication, chef_cuisinier_id)
VALUES
	(0401191, 'Plat : Salade de saumon', 'Une salade de la mer gourmande, qui ravira vos papilles par temps chaud', 12.90, 33, '2019-04-01', 2),
	(0401192, 'Plat : Salade de pâtes froides', 'Savourez une salade de pâtes froides et ses légumes de saison', 14.90, 42, '2019-04-01', 2),
	(0401193, 'Dessert : Tiramisu', 'Un délicieu tiramisu au spéculos', 3.90, 27, '2019-04-01', 1),
	(0401194, 'Dessert : Tarte au chocolat', 'Dévorez une généreuse part de tarte au chocolat et au daim', 2.80, 25, '2019-04-01', 1),
	(0402191, 'Plat : Salade de thon', 'Une salade de la mer, pleine de fraicheur', 12.90, 31, '2019-04-02', 3),
	(0402192, 'Plat : Salade de pâtes froides', 'Savourez une salade de pâtes froides au thon', 14.90, 29, '2019-04-02', 3),
	(0402193, 'Dessert : Tiramisu', 'Un délicieu tiramisu au chocolat', 3.50, 28, '2019-04-02', 4),
	(0402194, 'Dessert : Tarte au citron', 'Dévorez une belle part de tarte au citron', 2.80, 27, '2019-04-02', 4),
	(0403191, 'Plat : Sushi de saumon', 'Voyagez en Asie avec ces 6 sushis frais', 12.90, 33, '2019-04-03', 4),
	(0403192, 'Plat : Salade de saison', 'Découvrez une salade aux légumes de saison', 14.90, 32, '2019-04-03', 4),
	(0403193, 'Dessert : Eclair au café', 'Un délicieu éclair au café, recouvert de pistache', 3.90, 27, '2019-04-03', 1),
	(0403194, 'Dessert : Poire au chocolat', 'Fondez pour notre poire au chocolat', 2.80, 17, '2019-04-03', 1)

;

--Ajout de données table : livreur--

INSERT INTO livreur
	(nom, prenom, telephone, e_mail, latitude, longitude, statut)
VALUES
	('BABA', 'Mohammed', '0656486232', 'M.Baba@ExpressFood.com', 49.89745, 63.5624, 'Indisponible'),
	('ROUSET', 'Caroline', '063584512', 'C.Rouset@ExpressFood.com', 49.89236, 63.8745, 'En Livraison'),
	('COCHEFERT', 'Julien', '0763594856', 'J.Cochefert@ExpressFood.com', 49.89652, 63.8812, 'Libre')
;

--Ajout de données table : stock_livreur--

INSERT INTO stock_livreur
	(plat_id, livreur_id, quantite)
VALUES
	(9, 1, 5),
	(9, 2, 0),
	(9, 3, 7),
	(10, 1, 4),
	(10, 2 , 5),
	(10, 3, 0),
	(11, 1, 6),
	(11, 2, 3),
	(11, 3, 2),
	(12, 1, 4),
	(12, 2, 8),
	(12, 3, 1)
;

--Ajout de données table : commande--

INSERT INTO commande
	(numero_commande, date, prix_total_ttc, statut_commande, client_id, livreur_id)
VALUES
	(100, '2019-04-01 10:23:54', 47.70, 'Livrée', 1, 2),
	(101, '2019-04-01 11:28:14', 24.90, 'Livrée', 6, 2),
	(102, '2019-04-01 21:23:01', 14.90, 'Livrée', 2, 1),
	(103, '2019-04-02 12:14:33', 17.70, 'Livrée', 3, 3),
	(104, '2019-04-02 11:25:05', 16.80, 'Livrée', 5, 2),
	(105, '2019-04-02 12:34:47', 16.80, 'Livrée', 6, 1),
	(106, '2019-04-02 20:02:57', 27.80, 'Livrée', 7, 1),
	(107, '2019-04-02 21:51:15', 133.40, 'Livrée', 10, 3),
	(108, '2019-04-03 11:16:59', 30.60, 'En attente', 8, NULL),
	(109, '2019-04-03 12:03:38', 18.80, 'En cours', 9, 2),
	(110, '2019-04-03 11:48:24', 58.70, 'Livrée', 6, 3)
;


--Ajout de données table : adresse_livraison--

INSERT INTO adresse_livraison
	(num_contact, digicode, info_complementaire, commande_id, adresse_id)
VALUES
	('0612345678', NULL, NULL, 1, 1),
	('0692371865', NULL, 'Au bout du quai numéro 3', 2, 7),
	('0160676415', NULL, 'Demandez Mentor', 6, 12),
	('0142653617', '32A58', 'Appartement 302', 3, 2),
	('0672123478', NULL, NULL, 4, 3),
	('0656123456', '27BC3', '2 ème étage, appartement 231', 5, 5),
	('0612347780', NULL, 'contact par sms uniquement', 7, 8),
	('0692371865', NULL, 'entrez sans sonner', 11, 6),
	('0612234321', NULL, 'attention au chien', 8, 11),
	('0760123477', NULL, NULL, 9, 9),
	('0164891232', NULL, NULL, 10, 10)
;

--Ajout de données table : paiement--

INSERT INTO paiement
	(type_paiement, etat_paiement, commande_id)
VALUES
	('Espèce', true, 1),
	('CB', true, 2),
	('CB', true, 3),
	('CB', true, 4),
	('CB', true, 5),
	('Espèce', true, 6),
	('CB', true, 7),	
	('CB', true, 8),
	('CB', false, 9),
	('Espèce', false, 10),
	('CB', true, 11)
;

--Ajout de données table : commande_plat--

INSERT INTO commande_plat
	(commande_id, plat_id, quantite, prix_unitaire_ht, taux_tva_100)
VALUES
	(1, 1, 1, 8.90, 10),
	(1, 2, 2, 11.80, 10),
	(2, 1, 1, 8.90, 10),
	(2, 3, 1, 2.80, 10),
	(3, 2, 1, 11.80, 10),
	(4, 6, 1, 11.80, 10),
	(5, 5, 1, 8.90, 10),
	(6, 5, 1, 8.90, 10),
	(7, 5, 1, 8.90, 10),
	(7, 6, 1, 11.80, 10),
	(8, 5, 3, 8.90, 10),
	(8, 6, 2, 11.80, 10),
	(8, 7, 1, 2.80, 10),
	(8, 8, 4, 2.70, 10),
	(9, 10, 1, 11.80, 10),
	(9, 9, 1, 8.90, 10),
	(9, 12, 1, 1.70, 10),
	(10, 10, 1, 11.80, 10),
	(11, 11, 1, 10.70, 10),
	(11, 10, 2, 11.80, 10),
	(11, 12, 3, 2.20, 10)
;
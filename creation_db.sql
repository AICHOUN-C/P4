--Création des tables de leurs clées primaire idoïnes et de leurs index le cas échéant--

CREATE SEQUENCE public.chef_cuisinier_id_seq;

CREATE TABLE public.chef_cuisinier (
                chef_cuisinier_id INTEGER NOT NULL DEFAULT nextval('public.chef_cuisinier_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                e_mail VARCHAR(150) NOT NULL,
                CONSTRAINT chef_cuisinier_pk PRIMARY KEY (chef_cuisinier_id)
);


ALTER SEQUENCE public.chef_cuisinier_id_seq OWNED BY public.chef_cuisinier.chef_cuisinier_id;

CREATE SEQUENCE public.plat_id_seq;

CREATE TABLE public.plat (
                plat_id INTEGER NOT NULL DEFAULT nextval('public.plat_id_seq'),
                reference INTEGER NOT NULL,
                nom VARCHAR(50) NOT NULL,
                descriptif VARCHAR(300) NOT NULL,
                prix_unitaire_ttc NUMERIC(5,2) NOT NULL,
                quantite SMALLINT NOT NULL,
                date_fabrication DATE NOT NULL,
                chef_cuisinier_id INTEGER NOT NULL,
                CONSTRAINT plat_pk PRIMARY KEY (plat_id)
);


ALTER SEQUENCE public.plat_id_seq OWNED BY public.plat.plat_id;

CREATE UNIQUE INDEX plat_idx
 ON public.plat
 ( reference );

CREATE SEQUENCE public.livreur_id_seq;

CREATE TABLE public.livreur (
                livreur_id INTEGER NOT NULL DEFAULT nextval('public.livreur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                e_mail VARCHAR(150),
                latitude NUMERIC NOT NULL,
                longitude NUMERIC NOT NULL,
                statut VARCHAR(12) NOT NULL,
                CONSTRAINT livreur_pk PRIMARY KEY (livreur_id)
);


ALTER SEQUENCE public.livreur_id_seq OWNED BY public.livreur.livreur_id;

CREATE TABLE public.stock_livreur (
                plat_id INTEGER NOT NULL,
                livreur_id INTEGER NOT NULL,
                quantite SMALLINT NOT NULL,
                CONSTRAINT stock_livreur_pk PRIMARY KEY (plat_id, livreur_id)
);


CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.client (
                client_id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                e_mail VARCHAR(150) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (client_id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.client.client_id;

CREATE UNIQUE INDEX client_idx
 ON public.client
 ( telephone );

CREATE UNIQUE INDEX client_idx1
 ON public.client
 ( e_mail );

CREATE SEQUENCE public.commande_id_seq;

CREATE TABLE public.commande (
                commande_id INTEGER NOT NULL DEFAULT nextval('public.commande_id_seq'),
                numero_commande INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                prix_total_ttc NUMERIC(9,2) NOT NULL,
                statut_commande VARCHAR(21) NOT NULL,
                client_id INTEGER NOT NULL,
                livreur_id INTEGER,
                CONSTRAINT commande_pk PRIMARY KEY (commande_id)
);


ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.commande_id;

CREATE UNIQUE INDEX commande_idx
 ON public.commande
 ( numero_commande );

CREATE SEQUENCE public.paiement_id_seq;

CREATE TABLE public.Paiement (
                paiement_id INTEGER NOT NULL DEFAULT nextval('public.paiement_id_seq'),
                type_paiement VARCHAR(20) NOT NULL,
                etat_paiement BOOLEAN NOT NULL,
                commande_id INTEGER NOT NULL,
                CONSTRAINT paiement_pk PRIMARY KEY (paiement_id)
);


ALTER SEQUENCE public.paiement_id_seq OWNED BY public.Paiement.paiement_id;

CREATE TABLE public.commande_plat (
                commande_id INTEGER NOT NULL,
                plat_id INTEGER NOT NULL,
                quantite SMALLINT NOT NULL,
                prix_unitaire_ht NUMERIC(5,2) NOT NULL,
                taux_tva_100 NUMERIC(4,2) NOT NULL,
                CONSTRAINT commande_plat_pk PRIMARY KEY (commande_id, plat_id)
);


CREATE SEQUENCE public.adresse_id_seq;

CREATE TABLE public.adresse (
                adresse_id INTEGER NOT NULL DEFAULT nextval('public.adresse_id_seq'),
                destinataire VARCHAR(100) NOT NULL,
                numero_voie SMALLINT NOT NULL,
                voie VARCHAR(30) NOT NULL,
                complement_voie VARCHAR(50),
                code_postal INTEGER NOT NULL,
                localite VARCHAR(100) NOT NULL,
                client_id INTEGER NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.adresse_id;

CREATE INDEX adresse_idx
 ON public.adresse
 ( code_postal, localite );

CREATE SEQUENCE public.adresse_livraison_adresse_livraison_id_seq;

CREATE TABLE public.adresse_livraison (
                adresse_livraison_id INTEGER NOT NULL DEFAULT nextval('public.adresse_livraison_adresse_livraison_id_seq'),
                num_contact VARCHAR(10) NOT NULL,
                digicode VARCHAR(8),
                info_complementaire VARCHAR(150),
                commande_id INTEGER NOT NULL,
                adresse_id INTEGER NOT NULL,
                CONSTRAINT adresse_livraison_pk PRIMARY KEY (adresse_livraison_id)
);


ALTER SEQUENCE public.adresse_livraison_adresse_livraison_id_seq OWNED BY public.adresse_livraison.adresse_livraison_id;

CREATE SEQUENCE public.adresse_facturation_adresse_facturation_id_seq;

CREATE TABLE public.adresse_facturation (
                adresse_facturation_id INTEGER NOT NULL DEFAULT nextval('public.adresse_facturation_adresse_facturation_id_seq'),
                date TIMESTAMP NOT NULL,
                client_id INTEGER NOT NULL,
                adresse_id INTEGER NOT NULL,
                CONSTRAINT adresse_facturation_pk PRIMARY KEY (adresse_facturation_id)
);


ALTER SEQUENCE public.adresse_facturation_adresse_facturation_id_seq OWNED BY public.adresse_facturation.adresse_facturation_id;


--Création des clées étrangères--

ALTER TABLE public.plat ADD CONSTRAINT chef_cuisinier_plat_fk
FOREIGN KEY (chef_cuisinier_id)
REFERENCES public.chef_cuisinier (chef_cuisinier_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_plat ADD CONSTRAINT plat_commande_plat_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock_livreur ADD CONSTRAINT plat_stock_livreur_fk
FOREIGN KEY (plat_id)
REFERENCES public.plat (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock_livreur ADD CONSTRAINT livreur_stock_livreur_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (livreur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (livreur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse_facturation ADD CONSTRAINT client_adresse_facturation_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_plat ADD CONSTRAINT commande_ligne_plat_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse_livraison ADD CONSTRAINT commande_adresse_livraison_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Paiement ADD CONSTRAINT commande_paiement_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse_facturation ADD CONSTRAINT adresse_adresse_facturation_fk
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse_livraison ADD CONSTRAINT adresse_adresse_livraison_fk
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

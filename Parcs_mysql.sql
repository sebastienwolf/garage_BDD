CREATE DATABASE IF NOT EXISTS `PARCS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PARCS`;

CREATE TABLE `APPARTIENT` (
  `id_client` VARCHAR(42),
  `id_vente` VARCHAR(42),
  PRIMARY KEY (`id_client`, `id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CLIENT` (
  `id_client` VARCHAR(42),
  `nom` VARCHAR(42),
  `prenom` VARCHAR(42),
  `age` VARCHAR(42),
  `adresse` VARCHAR(42),
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VOITURE` (
  `id_voiture` VARCHAR(42),
  `marque` VARCHAR(42),
  `modele` VARCHAR(42),
  `etat` VARCHAR(42),
  `id_parc` VARCHAR(42),
  `date` VARCHAR(42),
  PRIMARY KEY (`id_voiture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PARC` (
  `id_parc` VARCHAR(42),
  `id_voiture` VARCHAR(42),
  `quantite_neuf` VARCHAR(42),
  `quantite_occasion` VARCHAR(42),
  PRIMARY KEY (`id_parc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VENDU` (
  `id_parc` VARCHAR(42),
  `id_vente` VARCHAR(42),
  `date` VARCHAR(42),
  PRIMARY KEY (`id_parc`, `id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `VENTE` (
  `id_vente` VARCHAR(42),
  `id_voiture` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONCERNE` (
  `id_parc` VARCHAR(42),
  `id_inventaire` VARCHAR(42),
  `date` VARCHAR(42),
  PRIMARY KEY (`id_parc`, `id_inventaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `INVENTAIRE` (
  `id_inventaire` VARCHAR(42),
  `id_parc` VARCHAR(42),
  `quantite_neuf` VARCHAR(42),
  `quantite_occasion` VARCHAR(42),
  PRIMARY KEY (`id_inventaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_vente`) REFERENCES `VENTE` (`id_vente`);
ALTER TABLE `APPARTIENT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENT` (`id_client`);
ALTER TABLE `VOITURE` ADD FOREIGN KEY (`id_parc`) REFERENCES `PARC` (`id_parc`);
ALTER TABLE `VENDU` ADD FOREIGN KEY (`id_vente`) REFERENCES `VENTE` (`id_vente`);
ALTER TABLE `VENDU` ADD FOREIGN KEY (`id_parc`) REFERENCES `PARC` (`id_parc`);
ALTER TABLE `CONCERNE` ADD FOREIGN KEY (`id_inventaire`) REFERENCES `INVENTAIRE` (`id_inventaire`);
ALTER TABLE `CONCERNE` ADD FOREIGN KEY (`id_parc`) REFERENCES `PARC` (`id_parc`);
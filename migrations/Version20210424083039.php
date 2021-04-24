<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210424083039 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE praticien (id INT AUTO_INCREMENT NOT NULL, type_id INT NOT NULL, nom VARCHAR(30) NOT NULL, prenom VARCHAR(30) NOT NULL, adresse VARCHAR(255) NOT NULL, cp VARCHAR(10) NOT NULL, ville VARCHAR(50) NOT NULL, coef_notoriete DOUBLE PRECISION NOT NULL, INDEX IDX_D9A27D3C54C8C93 (type_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE rapport_visite (id INT AUTO_INCREMENT NOT NULL, visiteur_id INT NOT NULL, bilan VARCHAR(255) NOT NULL, date_visite DATETIME NOT NULL, date_rapport DATETIME NOT NULL, INDEX IDX_D1D741717F72333D (visiteur_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_praticien (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(50) NOT NULL, lieu VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE visiteur (id INT AUTO_INCREMENT NOT NULL, praticien_id INT NOT NULL, nom VARCHAR(30) NOT NULL, prenom VARCHAR(30) NOT NULL, adresse VARCHAR(255) NOT NULL, cp VARCHAR(10) NOT NULL, ville VARCHAR(50) NOT NULL, login VARCHAR(30) DEFAULT NULL, mdp VARCHAR(30) DEFAULT NULL, INDEX IDX_4EA587B82391866B (praticien_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE praticien ADD CONSTRAINT FK_D9A27D3C54C8C93 FOREIGN KEY (type_id) REFERENCES type_praticien (id)');
        $this->addSql('ALTER TABLE rapport_visite ADD CONSTRAINT FK_D1D741717F72333D FOREIGN KEY (visiteur_id) REFERENCES visiteur (id)');
        $this->addSql('ALTER TABLE visiteur ADD CONSTRAINT FK_4EA587B82391866B FOREIGN KEY (praticien_id) REFERENCES praticien (id)');
        $this->addSql('ALTER TABLE delegue CHANGE password password VARCHAR(25) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE visiteur DROP FOREIGN KEY FK_4EA587B82391866B');
        $this->addSql('ALTER TABLE praticien DROP FOREIGN KEY FK_D9A27D3C54C8C93');
        $this->addSql('ALTER TABLE rapport_visite DROP FOREIGN KEY FK_D1D741717F72333D');
        $this->addSql('DROP TABLE praticien');
        $this->addSql('DROP TABLE rapport_visite');
        $this->addSql('DROP TABLE type_praticien');
        $this->addSql('DROP TABLE visiteur');
        $this->addSql('ALTER TABLE delegue CHANGE password password VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}

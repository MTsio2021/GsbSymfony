<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\Praticien;
use App\Entity\RapportVisite;
use App\Entity\TypePraticien;
use App\Entity\Visiteur;
use App\Entity\Delegue;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class AppFixtures extends Fixture
{
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }
    public function load(ObjectManager $manager)
    {

        $delegue = new Delegue();
        $delegue->setUsername('mtillier');
        $delegue->setPassword($this->encoder->encodePassword($delegue, '0000'));
        $manager->persist($delegue);

        $faker = Factory::create('fr_FR');
        // on crée 4 auteurs avec noms et prénoms "aléatoires" en français

        $typepraticien = array();

        for ($i = 0; $i < 10; $i++) {
            $typepraticien[$i] = new TypePraticien();
            $typepraticien[$i]->setLibelle($faker->word);
            $typepraticien[$i]->setLieu($faker->city);

            $manager->persist($typepraticien[$i]);
        }

        $praticien = array();
        for ($i = 0; $i < 20; $i++) {
            $praticien[$i] = new Praticien();
            $praticien[$i]->setType($typepraticien[$i % 10]);
            $praticien[$i]->setNom($faker->lastName);
            $praticien[$i]->setPrenom($faker->firstName);
            $praticien[$i]->setAdresse($faker->address);
            $praticien[$i]->setCp($faker->postcode);
            $praticien[$i]->setVille($faker->city);
            $praticien[$i]->setCoefNotoriete($faker->numberBetween($min = 1, $max = 3));
            $praticien[$i]->setCoefConfiance($faker->numberBetween($min = 1, $max = 3));

            $manager->persist($praticien[$i]);
        }

        $visiteur = array();
        for ($i = 0; $i <40; $i++){
            $visiteur[$i] = new Visiteur();
            $visiteur[$i]->setPraticien($praticien[$i % 20]);
            $visiteur[$i]->setNom($faker->lastName);
            $visiteur[$i]->setPrenom($faker->firstName);
            $visiteur[$i]->setAdresse($faker->address);
            $visiteur[$i]->setCp($faker->postcode);
            $visiteur[$i]->setVille($faker->city);
            $visiteur[$i]->setLogin($faker->word);
            $visiteur[$i]->setMdp($faker->password());

            $manager->persist($visiteur[$i]);
        }

        $rapportvisite = array();
        for ($i = 0; $i <100; $i++){
            $rapportvisite[$i] = new RapportVisite();
            $rapportvisite[$i]->setVisiteur($visiteur[$i % 40]);
            $rapportvisite[$i]->setBilan($faker->paragraph());
            $rapportvisite[$i]->setDateVisite($faker->date($format = 'Y-m-d', $max = 'now'));
            $rapportvisite[$i]->setDateRapport($faker->date($format = 'Y-m-d', $max = 'now'));
            $rapportvisite[$i]->setEtat($faker->boolean());
            
            $manager->persist($rapportvisite[$i]);
        }

        $manager->flush();
    }
}

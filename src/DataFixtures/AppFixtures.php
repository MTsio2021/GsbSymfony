<?php

namespace App\DataFixtures;

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
        $delegue->setLogin('Delmt');
        $manager->persist($delegue);
        $manager->flush();
    }
}

<?php

namespace App\Repository;

use App\Entity\RapportVisite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method RapportVisite|null find($id, $lockMode = null, $lockVersion = null)
 * @method RapportVisite|null findOneBy(array $criteria, array $orderBy = null)
 * @method RapportVisite[]    findAll()
 * @method RapportVisite[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RapportVisiteRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RapportVisite::class);
    }

    // /**
    //  * @return RapportVisite[] Returns an array of RapportVisite objects
    //  */
    
    public function findByDate($visiteur, $annee,$mois)
    {
        return $this->createQueryBuilder('r')
            ->where('r.dateRapport LIKE :date')
            ->andWhere('IDENTITY(r.visiteur) LIKE :visiteur')
            ->setParameter('date', $annee.'-'.$mois.'-%')
            ->setParameter('visiteur', $visiteur)
            ->getQuery()
            ->getResult()
        ;
    }
    

    /*
    public function findOneBySomeField($value): ?RapportVisite
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

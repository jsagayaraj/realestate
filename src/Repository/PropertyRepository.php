<?php

namespace App\Repository;

use App\Entity\Property;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Property|null find($id, $lockMode = null, $lockVersion = null)
 * @method Property|null findOneBy(array $criteria, array $orderBy = null)
 * @method Property[]    findAll()
 * @method Property[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PropertyRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Property::class);
    }

    // /**
    //  * @return Property[] Returns an array of Property objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Property
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
    /* find all annonce by decending order */
    public function findAllAnnonceByDESC(){
        return $this->createQueryBuilder('p')
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult()
        ;

    }

    /* find all announce louer */

    public function findAllAnnonceLouer()
    {
        return $this->createQueryBuilder('p')
                    ->addSelect('c')
                    ->join('p.category', 'c')
                    ->andWhere("c.title = 'Louer'")
                    ->orderBy('p.id', 'DESC')
                    //->setMaxResults(3)
                    ->getQuery()
                    ->getResult()
                    ;
    }

     /* find all announce vendre */

     public function findAllAnnonceVendre()
     {
         return $this->createQueryBuilder('p')
                     ->addSelect('c')
                     ->join('p.category', 'c')
                     ->andWhere("c.title = 'Vendre'")
                     ->orderBy('p.id', 'DESC')
                     //->setMaxResults(3)
                     ->getQuery()
                     ->getResult()
                     ;
     }


     /****************************** * FIND ALL APPARTEMENTS ************************************/

    public function findAllAppartement()
    {
        return $this->createQueryBuilder('p')
                    ->addSelect('t')
                    ->join('p.type', 't')
                    ->andWhere("t.title = 'Appartements'")
                    ->orderBy('p.id', 'DESC')
                    //->setMaxResults(3)
                    ->getQuery()
                    ->getResult()
                    ;
    }


      /****************************** * FIND ALL MAISON ************************************/

      public function findAllMaison()
      {
          return $this->createQueryBuilder('p')
                      ->addSelect('t')
                      ->join('p.type', 't')
                      ->andWhere("t.title = 'Maison'")
                      ->orderBy('p.id', 'DESC')
                      //->setMaxResults(3)
                      ->getQuery()
                      ->getResult()
                      ;
      }

     /* find all announce vendre */

    //  public function findAllAnnonceVendre()
    //  {
    //      return $this->createQueryBuilder('p')
    //                  ->addSelect('c')
    //                  ->join('p.category', 'c')
    //                  ->andWhere("c.title = 'Vendre'")
    //                  ->orderBy('p.id', 'DESC')
    //                  //->setMaxResults(3)
    //                  ->getQuery()
    //                  ->getResult()
    //                  ;
    //  }


}

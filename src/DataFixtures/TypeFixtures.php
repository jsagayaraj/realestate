<?php

namespace App\DataFixtures;

use App\Entity\Type;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class TypeFixtures extends Fixture
{
   public function load(ObjectManager $manager)
   {
      foreach ($this->typesData() as [$title]) {
         $type = new Type();
         $type->setTitle($title);
         $manager->persist($type);
      }
      $manager->flush();
   }


   private function typesData()
   {
      return[
        ['Appartement'],
        ['Maison'],
      ];
   }
}
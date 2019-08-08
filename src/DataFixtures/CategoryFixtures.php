<?php

namespace App\DataFixtures;

use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class CategoryFixtures extends Fixture
{
   public function load(ObjectManager $manager)
   {
      foreach ($this->categoriesData() as [$title]) {
         $category = new Category();
         $category->setTitle($title);
         $manager->persist($category);
      }
      $manager->flush();
   }


   private function categoriesData()
   {
      return[
        ['Louer'],
        ['Vendre'],
      ];
   }
}
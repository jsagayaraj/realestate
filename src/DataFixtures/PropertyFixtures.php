<?php

namespace App\DataFixtures;

use App\Entity\Type;
use App\Entity\Category;
use App\Entity\Property;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;


class PropertyFixtures extends Fixture
{
   public function load(ObjectManager $manager)
   {
      foreach ($this->getPropertiesData() as [$category_id, $type_id, $title, $description, $filename, $rooms, $floor, $heat, $surface, $price, $city, $address, $postalCode, $parking, $bathrooms]) 
      {
         $category = $manager->getRepository(Category::class)->find($category_id); //get category id
         $type = $manager->getRepository(Type::class)->find($type_id); //get type id
         $property = new Property();
         
         $property->setCategory($category);
         $property->setType($type);
         $property->setTitle($title);
         $property->setDescription($description);
         $property->setImageFile($filename);
         $property->setRooms($rooms);
         $property->setFloor($floor);
         $property->setHeat($heat);
         $property->setSurface($surface);
         $property->setPrice($price);
         //$property->setSold($sold);
         $property->setCity($city);
         $property->setAddress($address);
         $property->setPostalCode($postalCode);
         $property->setParking($parking);
         $property->setBathrooms($bathrooms);
         //$property->setCreatedAt($cratedAt);

         $manager->persist($property);

      }
      $manager->flush();
   }


   private function getPropertiesData()
   {
      return [
         [1, 1, 'Appartement à louer',  'Compiègne, à proximité de lUTC et du centre ville', 'property-1.jpg', 2, 3, 'Electrique', 50, '500', 'Compiègne', '15 av de paris', '25482', 'Oui', 1],
         [1, 1, 'Appartement à louer', 'Compiègne, à proximité de lUTC et du centre ville', 'property-1.jpg', 2, 3, 'Electrique', 50, '500', 'Compiègne', '15 av de paris', '25482', 'Oui', 1]
      ];
   }
}
<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // use the factory to create a Faker\Generator instance
        $faker = \Faker\Factory::create();
        for ($j=0; $j <=5 ; $j++) { 
            $category = new Category();
            $category->setRent($faker->word)
                    ->setSales($faker->word);
                    $manager->persist($category);
            
        
                for ($i=0; $i <=mt_rand(2, 6) ; $i++) { 
                    $property = new Property();
                    $property->setTitle($faker->sentence())
                            ->setDescription($faker->paragraphs(2))
                            ->setImage($faker->imageUrl)
                            ->setRooms($faker->randomDigit)
                            ->setBedrooms($faker->randomDigit)
                            ->setFloor($faker->randomDigit)
                            ->setHeat($faker->word)
                            ->setPrice("200000")
                            ->setCreatedAT($faker->dateTimeBetween('-6 months'))
                            ->setSold(true)
                            ->setCity($faker->city)
                            ->setAddress($faker->streetAddress)
                            ->setPostalCode($faker->postcode)
                            ->setBathrooms($faker->randomDigit)
                            ->setParking($faker->randomDigit)
                            ->setCategory($category);
        
        
                            $manager->persist($property);
                    
                }
        }






        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}

<?php

namespace App\DataFixtures;

use Faker\Factory;
use App\Entity\Type;
use App\Entity\User;
use App\Entity\Category;
use App\Entity\Comments;
use App\Entity\Property;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        // use the factory to create a Faker\Generator instance
        $faker = \Faker\Factory::create('fr_FR');
                   
            //CATEGORY
            for ($j=0; $j <=5 ; $j++) { 
                $category = new Category();
                $category->setTitle($faker->word);
                        
                        $manager->persist($category);
                
                for ($k=0; $k<=mt_rand(1,2); $k++){
                    $type = new Type();
                    $type->setTitle($faker->word);
                        
                        $manager->persist($type);
            
                    //PROPERTY
                    for ($i=0; $i <= mt_rand(2, 8); $i++) { 
                        
                        $property = new Property();
                        
                        $property->setTitle($faker->word(3, true))
                                ->setDescription($faker->paragraph(2))
                                ->setImageFile($faker->file($sourceDir = 'public/assets/images', $targetDir = '/public/images/uploads/properties'))
                                ->setRooms($faker->numberBetween(2, 8))
                                ->setFloor($faker->numberBetween(0, 20))
                                ->setHeat($faker->randomDigit)
                                ->setSurface($faker->numberBetween(20, 350))
                                ->setPrice($faker->numberBetween(100000, 1000000))
                                ->setCreatedAT($faker->dateTimeBetween('-6 months'))
                                ->setSold(false)
                                ->setCity($faker->city)
                                ->setAddress($faker->address)
                                ->setPostalCode($faker->randomDigit)
                                ->setBathrooms($faker->randomDigit)
                                ->setParking($faker->randomDigit)                                
                                ->setCategory($category)
                                ->setType($type);

                                $manager->persist($property);
                            }
                    }
            }
            for ($l=0; $l <= 8 ; $l++) { 
                $user = new User();
                $user->setFirstname($faker->firstName)
                    ->setLastname($faker->lastName)
                    ->setEmail($faker->email)
                    ->setPassword('password')
                    ->setGender($faker->titleMale)
                    ->setGender($faker->titleFemale)
                    ->setAddress($faker->streetAddress)
                    ->setCity($faker->city)
                    ->setPostalCode($faker->randomDigit)
                    ->setPhoneNumber($faker->randomDigit);
    
                    $manager->persist($user);
    
                    for ($b=0; $b <=mt_rand(4, 6) ; $b++) { 
                        $comments = new Comments();
    
                        $comments->setAuthor($faker->firstName)
                                ->setContent($faker->paragraph())
                                ->setCreatedAt($faker->dateTimeBetween('-6 months'))
                                ->setUser($user)
                                ->setProperty($property);
                            
                            $manager->persist($comments);
                    }
                }
                    

        $manager->flush();
    }
}

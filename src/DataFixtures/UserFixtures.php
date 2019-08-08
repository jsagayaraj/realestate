<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
   public function __construct(UserPasswordEncoderInterface $password_encoder)
   {
      $this->password_encoder = $password_encoder;
   }

   public function load(ObjectManager $manager) {
      foreach ($this->getUserData() as [$gender, $firstname, $lastname, $email, $password, $address, $city, $postalCode, $phoneNumber, $status, $isActive, $roles]) {
         $user = new User();
         $user->setGender($gender);
         $user->setFirstname($firstname);
         $user->setLastname($lastname);
         $user->setEmail($email);
         $user->setPassword($this->password_encoder->encodePassword($user, $password));
         $user->setAddress($address);
         $user->setCity($city);
         $user->setPostalCode($postalCode);
         $user->setPhoneNumber($phoneNumber);
         $user->setStatus($status);
         $user->setIsActive($isActive);
         $user->setRoles($roles);

         $manager->persist($user);

      }
      $manager->flush();
   }

   private function getUserData(): Array
   {
      return[
         ['Monsiuer', 'Admin', 'Admin', 'admin@test.com', 'test', '11 rue victor hugo', 'paris', '75010', '0145785421', 'admin', true, ['ROLE_ADMIN']],
         ['Monsiuer', 'Jhon', 'Doa', 'user@test.com', 'test', '11 rue de paris', 'paris', '75010', '0645784521', 'user', true, ['ROLE_USER']],
         ['Madame', 'Sylvie', 'Joseph', 'sylvie@test.com', 'test', '11 av de paris', 'nanterre', '92000', '2145745870', 'user', true, ['ROLE_USER']],
         ['Monsiuer', 'Navin', 'Joseph', 'navin@test.com', 'test', '11 rue victor hugo', 'paris', '75010', '0145785421', 'user', true, ['ROLE_USER']],
      ];
   }
}
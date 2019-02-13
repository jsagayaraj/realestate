<?php

namespace App\Controller\Security;

use App\Entity\User;

use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends AbstractController
{

    /**
     * @Route ("/inscription", name="registration")
     */
    public function registration(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $hash = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($hash);
           $manager->persist($user);
           $manager->flush();
           $this->addFlash('success', 'Vous êtes bien enregistré');
           return $this->redirectToRoute('admin_user_list');
        }else{
            return $this->render("security/registration.html.twig",[
                'form' => $form->createView()
            ]);
        }

    }

   
    /**
     * @Route("/connexion", name="security_login")
     */
    public function login()
    {
        return $this->render("security/login.html.twig");
    }

    /**
     * @Route("/deconnexion", name="security_logout")
     */

     public function logout(){}









}
<?php

namespace App\Controller\Security;

use App\Entity\User;

use App\Form\UserType;
use App\Form\EditProfileType;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use App\Event\UserRegisterEvent;
use App\Security\TokenGenerator;
use Doctrine\ORM\EntityManagerInterface;

class UserController extends AbstractController
{

    /**
     * @Route ("/inscription", name="registration")
     * 
     */
    public function registration(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder, EventDispatcherInterface $eventDispatcher, TokenGenerator $tokenGenerator)
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
           $hash = $encoder->encodePassword($user, $user->getPassword());
           $user->setPassword($hash);

            //set confirmationtoket with the length of 30 charecter(see Security/TokenGenerator.php)
           $user->setConfirmationToken($tokenGenerator->getRandomSecureToken(30));
           //set user status by default user
           $user->setStatus('user');
           $user->setRoles(['ROLE_USER']);
           $manager->persist($user);
           $manager->flush();
           //event listner
           $userRegisterEvent = new UserRegisterEvent($user);
           $eventDispatcher->dispatch(UserRegisterEvent::NAME, $userRegisterEvent);
           
           $this->addFlash('success', 'Vous êtes bien enregistré');
           return $this->redirectToRoute('login');
        }else{
            return $this->render("security/registration.html.twig",[
                'form' => $form->createView()
            ]);
        }

    }

    /**
     * @Route("/confirm/{token}", name="confirm")
     */
    public function confirm($token, UserRepository $userRepository, EntityManagerInterface $entityManager)
    {
        $user = $userRepository->findOneBy(['confirmationToken' => $token]);

        //if user is not null that means if user exist
        if(null !== $user){
            $user->setIsActive(true);
            $user->setConfirmationToken('');

            //save to database
            $entityManager->flush();
        }

        return $this->render('security/login.html.twig', [
            'user' => $user
        ]);
    }


    /**
     * @Route ("/edit-profil", name="edit_profil")
     */
    public function editProfil(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder)
    {
        $user = $this->getUser();
        //dd($user);
        $form = $this->createForm(EditProfileType::class, $user, ['user' => $user]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $user->setFirstname($request->request->get('edit_profile')['firstname']);
            $user->setLastname($request->request->get('edit_profile')['lastname']);
            $user->setEmail($request->request->get('edit_profile')['email']);
            $user->setPhoneNumber($request->request->get('edit_profile')['phoneNumber']);
            $user->setCity($request->request->get('edit_profile')['city']);
            $user->setPostalCode($request->request->get('edit_profile')['postalCode']);
            $user->setAddress($request->request->get('edit_profile')['address']);
            // $password = $encoder->encodePassword($user, $request->request->get('user')['password']['first']);
            // $user->setPassword($password);
            //set user status by default user
            
            $manager->persist($user);
            $manager->flush();
            $this->addFlash('success', 'Vous êtes bien modifier');
            return $this->redirectToRoute('profil');
        } else {
            return $this->render("security/edit-profile.html.twig", [
                'form' => $form->createView()
            ]);
        }
    }

    /**
     * @Route("/profil", name="profil")
     */

    public function profile()
    {
        return $this->render('security/profile.html.twig');
    }
   
    /**
     * @Route("/login", name="login")
     */
    public function login(AuthenticationUtils $authUtils)
    {
        // get the login error if there is one
        $error = $authUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authUtils->getLastUsername();

        return $this->render("security/login.html.twig", [
            'error' => $error,
            'lastUsername' => $lastUsername
            ]);
    }

    /**
     * @Route("/logout", name="logout")
     */

     public function logout(){
         return $this-render("home/index.html.twig");
     }









}
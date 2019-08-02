<?php

namespace App\Controller\Admin;

use App\Entity\User;
//use App\Form\UserType;
use App\Repository\TypeRepository;
use App\Repository\UserRepository;
use App\Repository\CategoryRepository;
use App\Repository\PropertyRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/admin")
 * 
 */

class AdminUserController extends AbstractController
{
    /**
     * @Route("/", name="admin")
     * 
     */
    public function adminPage(CategoryRepository $cat, TypeRepository $typeRepo, PropertyRepository $propertyRepo)
    {
        $categories = $cat->findAll();
        $types = $typeRepo->findAll();
        $properties = $propertyRepo->findAll();
        return $this->render('admin/index.html.twig', [
            'categories' => $categories,
            'types' => $types,
            'properties' => $properties

        ]);
    }



    /**
    * @Route("/userList", name="admin_user_list")
    */

    public function showUserList(UserRepository $repo)
    {
        $user = $repo->findAll();
        
        dump($user);
        return $this->render("admin/user/show_user_list.html.twig",[
            'users' => $user
            
        ]);
    }

    // /**
    //  * @Route("/profil", name="profil")
    //  */
    // public function profile()
    // {
    //     $user = $this->getUser();
    //     dump($user);
    //     return $this->render("home/profil.html.twig", [
    //         'user' => $user
    //     ]);
    // }



    /**
    * @Route("/admin/editUser/{id}", name="admin_edit_user")
    */

    public function editUser(User $user, Request $request, ObjectManager $em)
    {
        $form = $this->createFormBuilder($user)
                ->add('firstname')
                ->add('lastname')
                ->add('status', ChoiceType::class,[
                    'choices' =>[
                        'user' => 'user',
                        'admin' => 'admin',
                    ], 'expanded' => true, //list déroulante
                ])
                ->add('roles', ChoiceType::class,[
                    'choices' =>[
                        'Utilisateur de base' => 'ROLE_USER',
                        'Administrateur' => 'ROLE_ADMIN',
                    ],  
                        'expanded' => true, //liste déroulante
                        'multiple'=> true,
                ])
                ->getForm();
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid())
        {
            // $user = $form->getUser();
            // dump($user);
            // exit();
            $em->persist($user);
            $em->flush();
            $this->addFlash('success', 'User a été bien modifier');
            return $this->redirectToRoute('admin_user_list');
        }else{
            return $this->render("admin/user/edit_user.html.twig",[
                'form' => $form->createView()
            ]);
        }

    }


   
}

<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminUserController extends AbstractController
{
    /**
     * @Route("/admin", name="admin")
     * 
     */
    public function adminPage()
    {
        return $this->render('admin/index.html.twig');
    }



    /**
    * @Route("/admin/userList", name="admin_user_list")
    */

    public function showUserList(UserRepository $repo)
    {
        $user = $repo->findAll();
        
        dump($user);
        return $this->render("admin/show_user_list.html.twig",[
            'users' => $user
            
        ]);
    }

    /**
     * @Route("/profil", name="profil")
     */
    public function profile()
    {
        $user = $this->getUser();
        dump($user);
        return $this->render("home/profil.html.twig", [
            'user' => $user
        ]);
    }

    // /**
    // * @Route("/admin/editUser/{id}", name="admin_edit_user")
    // */

    // public function editUser(User $user, UserRepository $repo, ObjectManager $em)
    // {
    //     $form = $this->createFrom(UserType::class, $user);
    //     $form->handleRequests($request);
    //     if($form->isSubmittet() && $form->isValid())
    //     {
    //         $user = $form->getUser();
    //         dump($user);
    //         $em->persist($user);
    //         $em->flush();

    //     }else{
    //         return $this->render("admin/edit_user.html.twig",[
    //             'form' => $form->createView()
    //         ]);
    //     }

    // }


   
}

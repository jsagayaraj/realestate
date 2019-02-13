<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminUserController extends AbstractController
{

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


    // /**
    // * @Route("/admin/editUser/{id}", name="admin_edit_user")
    // */

    // public function editUser(User $user, UserRepository $repo)
    // {
        
    //     dump($user);
    //     return $this->render("admin/edit_user.html.twig",[
    //         'users' => $user
            
    //     ]);
    // }


    // /**
    //  * @Route("/admin/{id}", name="admin_user_delete")
    //  * 
    //  */
    // public function deleteUser (User $user, ObjectManager $em, Request $request)
    // {
    //     if($this->isCsrfTokenValid('delete' . $user->getId(), $request->get('_token')))
    //     {
    //         //dump('suppression');
    //         $em->remove($user);
    //         $em->flush();
    //         return new Response('Suppression');
    //         $this->addFlash('success', 'Bien supprimé avec succés');
    //     }
    //     return $this->redirectToRoute('admin_user_delete');
    // }
}

<?php

namespace App\Controller\Admin;

use App\Entity\Type;
use App\Form\TypeType;
use App\Repository\TypeRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TypeController extends AbstractController
{

    /**
     * @Route("/admin/addType", name="admin_add_type")
     */
    public function createType(Request $request, ObjectManager $em)
    {
        $type = new Type();
        $form = $this->createForm(TypeType::class, $type);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $em->persist($type);
            $em->flush();
            $this->addFlash('success',"Bine ajouté");
            return $this->redirectToRoute("admin_show_type");
        }else{
            return $this->render("admin/type/new.html.twig",[
                'form' => $form->createView()
            ]);            
        }
    }

     /////////////////////////////SHOW LIST////////////////////////////
    /**
     * @Route("/admin/showType", name="admin_show_type")
     */
    public function showType(Type $type, TypeRepository $repo)
    {
        $type = $repo->findAll();
        return $this->render("admin/type/show.html.twig",[
            'types' => $type
        ]);
    }



    /////////////////////////////UPDATE////////////////////////////
    /**
     * @Route("/admin/editType/{id}", name="admin_edit_type")
     */
    public function editType(Type $type, ObjectManager $em, Request $request)
    {
        
        $form = $this->createForm(TypeType::class, $type);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $em->persist($type);
            $em->flush();
            $this->addFlash('success', "bine modifié");
            return $this->redirectToRoute("admin_show_type");
        }else{
            return $this->render("admin/type/edit.html.twig",[
                'form' => $form->createView()
            ]);            
        }
    }




    ////////////////////////////////DELETE///////////////////////////////
    /**
   * @Route("/admin/type/{id}", name="admin_delete_type")
   * 
   */
  public function deleteType (Type $type, ObjectManager $em, Request $request)
  {
      if($this->isCsrfTokenValid('delete' . $type->getId(), $request->get('_token')))
      {
          //dump('suppression');
          $em->remove($type);
          $em->flush();
          //return new Response('Suppression');
          $this->addFlash('success', 'Bien supprimé avec succés');
      }
      return $this->redirectToRoute('admin_show_type');
  }

}

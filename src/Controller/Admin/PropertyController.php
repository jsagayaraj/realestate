<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Property;
use App\Repository\UserRepository;
use App\Repository\PropertyRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PropertyController extends AbstractController
{

  // /**
  //  * @Route("/admin/newProperty", name="admin_new_property")
  //  */
  // public function newProperty(Request $request, ObjectManager $manager)
  // {
  //   $property = new Property();
  //   $form = $this->createForm(PropertyType::class, $property);
  //   $form->handleRequest($request);

  //    if($form->isSubmitted() && $form->isValid())
  //     {
  //       $manager->persist($property);
  //       $manager->flush();
  //       $this->addFlash('success', 'Bien creer avec succés');
  //       return $this->redirectToRoute('home');     
  //       //dump($result);
  //     }
  //       else {
  //         return $this->render('Admin/property/new.html.twig',[
  //           //'property' => $property,
  //         'form'=> $form->createView()
  //       ]);
  //     }
  //   }
  // }



  /**
   * @Route("/admin/propertyList", name="admin_property_list")
   */
  public function showProperty(PropertyRepository $repo)
  {
    $property = $repo->findAll();
    dump($property);
    return $this->render("admin/property/showList.html.twig", [
      'properties' => $property
    ]);

  }


  /**
     * @Route("/admin/{id}", name="admin_property_delete")
     * 
     */
    public function deleteUser (Property $property, ObjectManager $em, Request $request)
    {
        if($this->isCsrfTokenValid('delete' . $property->getId(), $request->get('_token')))
        {
            //dump('suppression');
            $em->remove($property);
            $em->flush();
            //return new Response('Suppression');
            $this->addFlash('success', 'Bien supprimé avec succés');
        }
        return $this->redirectToRoute('admin_property_list');
    }
    
}

<?php

namespace App\Controller\Admin;


use App\Entity\Property;

use App\Form\PropertyType;
use App\Repository\PropertyRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


/**
 * @Route("/admin")
 */

class PropertyController extends AbstractController
{
  /********************************CREATE NEW PROPERTY ***************************/
  /**
   * @Route("/newProperty", name="admin_new_property")
   */
  public function newProperty(Request $request, ObjectManager $manager)
  {
    $property = new Property();
    $form = $this->createForm(PropertyType::class, $property);
            $form->handleRequest($request);

     if($form->isSubmitted() && $form->isValid())
      {
        // $file = $property->getImage(); 
        // $fileName = md5(uniqid()).'.'.$file->guessExtension(); 
        // $file->move($this->getParameter('photos_directory'), $fileName); 
        // $property->setImage($fileName);

        $manager->persist($property);
        $manager->flush();
        $this->addFlash('success', 'Bien creer avec succés');
        return $this->redirectToRoute('admin_property_list');     
        //dump($result);
      }
        else {
          return $this->render('Admin/property/new.html.twig',[
          //'property' => $property,
          'form'=> $form->createView()
        ]);
      }
  }
  

/********************************SHOW PROPERTY ***************************/

  // /**
  //  * @Route("/showProperties", name="admin_property_list")
  //  * 
  //  */
  // public function showProperty(PropertyRepository $repo)
  // {
  //   $property = $repo->findAll();
  //   dump($property);
  //   return $this->render("admin/property/showList.html.twig", [
  //     'properties' => $property
  //   ]);

  // }

  /********************************EDIT PROPERTY ***************************/

  /**
   * @Route("/editProp/{id}", name="admin_edit_property")
   * 
   */
  public function editProperty(Property $property, ObjectManager $em, Request $request)
  {
    //$property->setImage(new File($this->getParameter('photos_directory'). '/'.$property->getImage()));
    $form = $this->createForm(PropertyType::class, $property);
            $form->handleRequest($request);

    if($form->isSubmitted() && $form->isValid()){
      if($property->getImageFile())
      //$property = $form->getData();
      // dump($property);
      // die();
      
      // $file = $property->getImage(); 
      // $fileName = md5(uniqid()).'.'.$file->guessExtension(); 
      // $file->move($this->getParameter('photos_directory'), $fileName); 

      $em->persist($property);
      $em->flush();
      $this->addFlash('success', 'Bien modifieé l\'annonce');
        return $this->redirectToRoute('admin_property_list');    
    }else{
      return $this->render("admin/property/edit.html.twig", [
        'form' => $form->createView()
        //'properties' => $property
      ]);
    }
    

  }
  /********************************DELETE PROPERTY ***************************/

  /**
   * @Route("/property/delete/{id}", name="admin_property_delete")
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
      return $this->redirectToRoute('admin');
  }
    
}



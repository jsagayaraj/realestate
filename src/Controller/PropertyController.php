<?php

namespace App\Controller;


use App\Entity\Property;

use App\Form\PropertyType;
use App\Repository\TypeRepository;
use App\Repository\PropertyRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PropertyController extends AbstractController
{

  /**
   * @Route("/annonces", name="annonces")
   */

   public function showAllAnnonces(PropertyRepository $repo){
    $property = $repo->findAllAnnonceByDESC();
    dump($property);
    return $this->render('home/annonce.html.twig',[
      'properties' => $property
    ]);
   }

   /************************************SHOW PROPERTIES - VENDRE AND LOUER - INDEX PAGE************************************* */
  /**
   * @Route("/", name="home")
   */
  public function showProperties(PropertyRepository $repo, TypeRepository $type_Repo)
  {
    $property_louer = $repo->findAllAnnonceLouer();
    $property_vendre = $repo->findAllAnnonceVendre();
    $type = $type_Repo->findAll();
    //dump($property_vendre);
    return $this->render("home/index.html.twig", [
      'properties_vendre' => $property_vendre,
      'properties_louer' => $property_louer,
      'types' => $type
    ]);

  } 

  /*************************************** ANNONCE LOUER PAGE-ANNOUNCE ********* */

  /**
   * @Route("/annonce-louer", name="annonce_louer")
   */

  public function showAnnonceLouer(PropertyRepository $repo)
  {
    $property_louer = $repo->findAllAnnonceLouer();
      return $this->render("home/annonce-louer.html.twig",[
          'annonce_louer' => $property_louer
      ]);
  }

   /************************************** ANNONCE VENDRE PAGE-VENDRE *****************/ 
   /**
   * @Route("/annonce-vendre", name="annonce_vendre")
   */

  public function showAnnonceVendre(PropertyRepository $repo)
  {
    $property_vendre = $repo->findAllAnnonceVendre();
      return $this->render("home/annonce-vendre.html.twig",[
          'annonce_vendre' => $property_vendre
      ]);
  }


  /**
  * @Route("/search", name="search")
  */
    public function appartement(Request $request, PropertyRepository $repo){
      //dump($request->request->get('type')); or ($request->request->all()) this line help us to find whether this function recuper information from formulaire. (eg: here i test select element from formulaire)
       //die();
      $type = $request->request->get('type');
      if($type == 1)
      {
        $type = $repo->findAllAppartement();
            return $this->render("home/appartement.html.twig",[
                'types' => $type
            ]);
      }else{
        $type_maison = $repo->findAllMaison();
        return $this->render("home/appartement.html.twig",[
          'types' => $type_maison
      ]);
      }
      
      
 }












    
}



<?php

namespace App\Controller;


use App\Entity\Contact;

use App\Entity\Property;
use App\Form\ContactType;
use App\Form\PropertyType;
use App\Repository\TypeRepository;
use App\Repository\PropertyRepository;
use App\Notification\ContactNotification;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PropertyController extends AbstractController
{
  private $em;
  private $repository;
  private $type_Repo;


  public function __construct(PropertyRepository $repository, TypeRepository $type_Repo, ObjectManager $em)
  {
    $this->repository = $repository;
    $this->em = $em;
    $this->type_repo = $type_Repo;
  }

  /**
   * @Route("/annonces", name="annonces")
   */

   // Include the paginator through dependency injection, the autowire needs to be enabled in the project
   public function showAllAnnonces(PaginatorInterface $paginator, Request $request){
    
    // Find all the data on the Property table, filter your query as you need
    $allPropertyQuery = $this->repository->createQueryBuilder('p')
                                        ->orderBy('p.id', 'DESC')
                                        ->getQuery();
    

    //Paginate the results of the query
    $properties = $paginator->paginate(
      //Doctrine Query, not results
      $allPropertyQuery,
      //Define the page parameter
      $request->query->getInt('page', 1),
      //Items per page
      6
    );
    dump($properties);
    return $this->render('home/annonce.html.twig',[
      'properties' => $properties
    ]);
   }

   /************************************SHOW PROPERTIES - VENDRE AND LOUER - INDEX PAGE************************************* */
  /**
   * @Route("/", name="home")
   */
  public function showProperties()
  {
    $property_louer = $this->repository->findAllAnnonceLouer();
    $property_vendre = $this->repository->findAllAnnonceVendre();
    $type =$this->type_repo->findAll();
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

  public function showAnnonceLouer()
  {
    $property_louer = $this->repository->findAllAnnonceLouer();
      return $this->render("home/annonce-louer.html.twig",[
          'annonce_louer' => $property_louer
      ]);
  }

   /************************************** ANNONCE VENDRE PAGE-VENDRE *****************/ 
   /**
   * @Route("/annonce-vendre", name="annonce_vendre")
   */

  public function showAnnonceVendre()
  {
    $property_vendre = $this->repository->findAllAnnonceVendre();
      return $this->render("home/annonce-vendre.html.twig",[
          'annonce_vendre' => $property_vendre
      ]);
  }


      /**
      * @Route("/search", name="search")
      */
    public function appartement(Request $request){
      //dump($request->request->get('type')); or ($request->request->all()) this line help us to find whether this function recuper information from formulaire. (eg: here i test select element from formulaire)
       //die();
      $type = $request->request->get('type');
      if($type == 1)
      {
        $type = $this->repository->findAllAppartement();
            return $this->render("home/appartement.html.twig",[
                'types' => $type
            ]);
      }else{
        $type_maison = $this->repository->findAllMaison();
        return $this->render("home/appartement.html.twig",[
          'types' => $type_maison
      ]);
      }
      
    }
    
    /**
     * @Route("/biens/{slug}-{id}", name="property_show", requirements={"slug": "[a-z0-9\-]*"})
     */
    public function show(Property $property, string $slug, Request $request, ContactNotification $notification)    
    {
        if($property->getSlug() !== $slug){
          return $this->redirectToRoute('property_show', [
            'id' => $property->getId(),
            'slug' => $property->getSlug()
            ]);
          }
          $contact = new Contact();
          $contact->setProperty($property);
          $form = $this->createForm(ContactType::class, $contact);
          $form->handleRequest($request);
          if($form->isSubmitted() &&  $form->isValid()){
            $notification->notify($contact);
            $this->addFlash('success', 'Votre email a bien été envoyé');
          
          return $this->redirectToRoute('property_show', [
              'id' => $property->getId(),
              'slug' => $property->getSlug()
            ]);
          }

        return $this->render("home/show.html.twig",[
          'property' => $property,
          'form'=> $form->createView()
        ]);
     
 
   
    }

}
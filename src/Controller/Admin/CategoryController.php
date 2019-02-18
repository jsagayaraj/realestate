<?php

namespace App\Controller\Admin;



use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategoryController extends AbstractController
{

    /**
     * @Route("/admin/addCategory", name="admin_add_category")
     */
    public function createCat(Request $request, ObjectManager $em)
    {
        $category = new Category();
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $em->persist($category);
            $em->flush();
            $this->addFlash('success', "Category bine ajouté");
            return $this->redirectToRoute("admin_show_cat");
        }else{
            return $this->render("admin/category/new.html.twig",[
                'form' => $form->createView()
            ]);            
        }
    }

     /////////////////////////////SHOW LIST////////////////////////////
    /**
     * @Route("/admin/showCat", name="admin_show_cat")
     */
    public function showCat(CategoryRepository $repo)
    {
        $category = $repo->findAll();
        return $this->render("admin/category/show.html.twig",[
            'categories' => $category
        ]);
    }



    /////////////////////////////UPDATE////////////////////////////
    /**
     * @Route("/admin/editCat/{id}", name="admin_edit_cat")
     */
    public function editCat(Category $category, ObjectManager $em, Request $request)
    {
        
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $em->persist($category);
            $em->flush();
            $this->addFlash('success', "Category bine ajouté");
            return $this->redirectToRoute("admin_show_cat");
        }else{
            return $this->render("admin/category/edit.html.twig",[
                'form' => $form->createView()
            ]);            
        }
    }




    ////////////////////////////////DELETE///////////////////////////////
    /**
   * @Route("/admin/cat/{id}", name="admin_cat_delete")
   * 
   */
  public function deleteCat (Category $category, ObjectManager $em, Request $request)
  {
      if($this->isCsrfTokenValid('delete' . $category->getId(), $request->get('_token')))
      {
          //dump('suppression');
          $em->remove($category);
          $em->flush();
          //return new Response('Suppression');
          $this->addFlash('success', 'Bien supprimé avec succés');
      }
      return $this->redirectToRoute('admin_show_cat');
  }

}

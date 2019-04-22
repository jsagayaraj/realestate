<?php

namespace App\Controller;


use App\Entity\Type;


use App\Repository\TypeRepository;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TypeController extends AbstractController
{
    /**
     * @Route("/search", name="search-appt")
     */
    public function appartement(TypeRepository $repo){
        $types = $repo->findAll();
        dump($types);
            return $this->render("include/header.html.twig",[
                'type' => $types
            ]);
   }

}
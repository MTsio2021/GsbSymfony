<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CompteRenduController extends AbstractController
{
    /**
     * @Route("/compterendu", name="compte_rendu")
     */
    public function index(): Response
    {
        return $this->render('compte_rendu/index.html.twig', [
            'controller_name' => 'CompteRenduController',
        ]);
    }
    /**
     * @Route("/compterendu/show", name="compte_rendu_show")
     */
    public function show(): Response
    {
        return $this->render('compte_rendu/show.html.twig', [
            'controller_name' => 'CompteRenduController',
        ]);
    }
}

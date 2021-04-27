<?php

namespace App\Controller;

use App\Repository\PraticienRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PraticienController extends AbstractController
{

    private $repository;

    public function __construct(PraticienRepository $repository)
    {
        $this->repository = $repository;
    }
    /**
     * @Route("/praticien", name="praticien")
     */
    public function index(): Response
    {
        $praticiens = $this->repository->findAll();
        return $this->render('praticien/index.html.twig', [
            'praticiens' => $praticiens,
        ]);
    }

    /**
     * @Route("/praticienconf", name="praticienconf")
     */
    public function conf(): Response
    {
        $praticiens = $this->repository->findBy(array(),array('coefConfiance' => 'DESC'));
        return $this->render('praticien/index.html.twig', [
            'praticiens' => $praticiens,
        ]);
    }

    /**
     * @Route("/praticientmpsec", name="praticientmpsec")
     */
    public function tmpsec(): Response
    {
        $praticiens = $this->repository->findBy(array(),array('coefConfiance' => 'DESC'));
        return $this->render('praticien/index.html.twig', [
            'praticiens' => $praticiens,
        ]);
    }

    /**
     * @Route("/praticiennot", name="praticiennot")
     */
    public function not(): Response
    {
        $praticiens = $this->repository->findBy(array(),array('coefNotoriete' => 'DESC'));
        return $this->render('praticien/index.html.twig', [
            'praticiens' => $praticiens,
        ]);
    }
}

<?php


namespace App\Controller;

use App\Entity\RapportVisite;
use App\Form\CompteRenduType;
use App\Repository\RapportVisiteRepository;
use App\Repository\VisiteurRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CompteRenduController extends AbstractController
{

    private $repositoryrapport;
    private $repositoryvisiteur;

    public function __construct(RapportVisiteRepository $repositoryrapport, VisiteurRepository $repositoryvisiteur)
    {
        $this->repositoryrapport = $repositoryrapport;
        $this->repositoryvisiteur = $repositoryvisiteur;

    }

    /**
     * @Route("/compterendu", name="compte_rendu")
     */
    public function index(): Response
    {

        $rapports = $this->repositoryrapport->findAll();
        $visiteurs = $this->repositoryvisiteur->findAll();
        return $this->render('compte_rendu/index.html.twig', [
            'rapports' => $rapports, 'visiteurs' => $visiteurs
        ]);
    }
    /**
     * @Route("/compterendu/show/{id}", name="compte_rendu_show")
     */
    public function show(RapportVisite $rapport): Response
    {   
        $rapport = $this->repositoryrapport->find($rapport);
        return $this->render('compte_rendu/show.html.twig', [
            'rapport' => $rapport,
        ]);
    }

    /**
     * @Route("/compterendu/create", name="compte_rendu_create")
     */
    public function create(): Response
    {   
        $form = $this->createForm(CompteRenduType::class);
        return $this->render('compte_rendu/create.html.twig', [
            'form' => $form->createView()
        ]);
    }


}

<?php


namespace App\Controller;

use App\Entity\RapportVisite;
use App\Form\CompteRenduType;
use App\Repository\RapportVisiteRepository;
use App\Repository\VisiteurRepository;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CompteRenduController extends AbstractController
{

    private $repositoryrapport;
    private $repositoryvisiteur;

    public function __construct(RapportVisiteRepository $repositoryrapport, VisiteurRepository $repositoryvisiteur, EntityManagerInterface $em)
    {
        $this->repositoryrapport = $repositoryrapport;
        $this->repositoryvisiteur = $repositoryvisiteur;
        $this->em = $em;


    }

    /**
     * @Route("/compterendu", name="compte_rendu")
     */
    public function index(Request $request): Response
    {
        if ($request->get('visiteur') || $request->get('mois') || $request->get('annee')) {

            $mois = strval($request->get('mois'));
            $annee = strval($request->get('annee'));
            $visiteur = $request->get('visiteur');
            /* $rapports = $this->repositoryrapport->findBy(['visiteur' => $request->get('visiteur'), 'dateRapport' => "$annee-$mois-02"]); */
            $rapports = $this->repositoryrapport->findByDate($visiteur, $annee, $mois);
        }
        else {
            $rapports = $this->repositoryrapport->findAll();
        }

        
        $visiteurs = $this->repositoryvisiteur->findAll();
        return $this->render('compte_rendu/index.html.twig', [
            'rapports' => $rapports, 'visiteurs' => $visiteurs
        ]);
    }
    /**
     * @Route("/compterendu/show/{id}", name="compte_rendu_show_{id}")
     */
    public function show(RapportVisite $rapport): Response
    {   
        $rapport->setEtat(true);
        $this->em->flush();
        $rapport = $this->repositoryrapport->find($rapport);
        return $this->render('compte_rendu/show.html.twig', [
            'rapport' => $rapport,
        ]);
    }

    /**
     * @Route("/compterendu/create", name="compte_rendu_create")
     */
    public function create(Request $request): Response
    {   
        $rapport = new RapportVisite();
        $form = $this->createForm(CompteRenduType::class, $rapport);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $this->em->persist($rapport);
            $this->em->flush();
            $this->addFlash('success', 'Compte rendu enregistré avec succès');
            return $this->redirectToRoute('compte_rendu_create');
        }
        return $this->render('compte_rendu/create.html.twig', [
            'rapport' => $rapport,
            'form' => $form->createView()
        ]);
    }


}

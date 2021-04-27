<?php

namespace App\Entity;

use App\Repository\PraticienRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PraticienRepository::class)
 */
class Praticien
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $prenom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $adresse;

    /**
     * @ORM\Column(type="string", length=10)
     */
    private $cp;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $ville;

    /**
     * @ORM\Column(type="float")
     */
    private $coefNotoriete;

    /**
     * @ORM\OneToMany(targetEntity=Visiteur::class, mappedBy="praticien")
     */
    private $visiteur;

    /**
     * @ORM\ManyToOne(targetEntity=TypePraticien::class, inversedBy="praticiens")
     * @ORM\JoinColumn(nullable=false)
     */
    private $type;

    /**
     * @ORM\Column(type="float")
     */
    private $coefConfiance;

    public function __construct()
    {
        $this->visiteur = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): self
    {
        $this->adresse = $adresse;

        return $this;
    }

    public function getCp(): ?string
    {
        return $this->cp;
    }

    public function setCp(string $cp): self
    {
        $this->cp = $cp;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(string $ville): self
    {
        $this->ville = $ville;

        return $this;
    }

    public function getCoefNotoriete(): ?float
    {
        return $this->coefNotoriete;
    }

    public function setCoefNotoriete(float $coefNotoriete): self
    {
        $this->coefNotoriete = $coefNotoriete;

        return $this;
    }

    /**
     * @return Collection|Visiteur[]
     */
    public function getVisiteur(): Collection
    {
        return $this->visiteur;
    }

    public function addVisiteur(Visiteur $visiteur): self
    {
        if (!$this->visiteur->contains($visiteur)) {
            $this->visiteur[] = $visiteur;
            $visiteur->setPraticien($this);
        }

        return $this;
    }

    public function removeVisiteur(Visiteur $visiteur): self
    {
        if ($this->visiteur->removeElement($visiteur)) {
            // set the owning side to null (unless already changed)
            if ($visiteur->getPraticien() === $this) {
                $visiteur->setPraticien(null);
            }
        }

        return $this;
    }

    public function getType(): ?TypePraticien
    {
        return $this->type;
    }

    public function setType(?TypePraticien $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getCoefConfiance(): ?float
    {
        return $this->coefConfiance;
    }

    public function setCoefConfiance(float $coefConfiance): self
    {
        $this->coefConfiance = $coefConfiance;

        return $this;
    }
}

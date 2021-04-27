<?php

namespace App\Entity;

use App\Repository\RapportVisiteRepository;
use DateTimeInterface;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=RapportVisiteRepository::class)
 */
class RapportVisite
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text")
     */
    private $bilan;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $dateVisite;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $dateRapport;

    /**
     * @ORM\ManyToOne(targetEntity=Visiteur::class, inversedBy="rapport")
     * @ORM\JoinColumn(nullable=false)
     */
    private $visiteur;

    /**
     * @ORM\Column(type="boolean")
     */
    private $etat;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBilan(): ?string
    {
        return $this->bilan;
    }

    public function setBilan(string $bilan): self
    {
        $this->bilan = $bilan;

        return $this;
    }

    public function getDateVisite(): ?string
    {
        return $this->dateVisite;
    }

    public function setDateVisite(string $dateVisite): self
    {
        $this->dateVisite = $dateVisite;

        return $this;
    }

    public function getDateRapport(): ?string
    {
        return $this->dateRapport;
    }

    public function setDateRapport(string $dateRapport): self
    {
        $this->dateRapport = $dateRapport;

        return $this;
    }

    public function getVisiteur(): ?Visiteur
    {
        return $this->visiteur;
    }

    public function setVisiteur(?Visiteur $visiteur): self
    {
        $this->visiteur = $visiteur;

        return $this;
    }

    public function getEtat(): ?bool
    {
        return $this->etat;
    }

    public function setEtat(bool $etat): self
    {
        $this->etat = $etat;

        return $this;
    }

}

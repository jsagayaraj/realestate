<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CategoryRepository")
 */
class Category
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $rent;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $sale;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRent(): ?string
    {
        return $this->rent;
    }

    public function setRent(string $rent): self
    {
        $this->rent = $rent;

        return $this;
    }

    public function getSale(): ?string
    {
        return $this->sale;
    }

    public function setSale(string $sale): self
    {
        $this->sale = $sale;

        return $this;
    }
}

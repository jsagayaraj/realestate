<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TypeRepository")
 */
class Type
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
    private $appartments;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $house;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAppartments(): ?string
    {
        return $this->appartments;
    }

    public function setAppartments(string $appartments): self
    {
        $this->appartments = $appartments;

        return $this;
    }

    public function getHouse(): ?string
    {
        return $this->house;
    }

    public function setHouse(string $house): self
    {
        $this->house = $house;

        return $this;
    }
}

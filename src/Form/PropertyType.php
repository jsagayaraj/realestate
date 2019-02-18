<?php

namespace App\Form;

use App\Entity\Type;
use App\Entity\Category;
use App\Entity\Property;
use App\Form\PropertyType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class PropertyType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('description')
            ->add('image', FileType::class)
            ->add('rooms')
            ->add('floor')
            ->add('heat', ChoiceType::class, [
                'choices' => [
                    'Electrique' => 'Electrique',
                    'Gaz' => 'Gaz',
                ],
            ])
            ->add('surface')
            ->add('price')
            ->add('sold')
            ->add('city')
            ->add('address')
            ->add('postalCode')
            ->add('parking', ChoiceType::class,[
                'choices' => [
                    'Oui' => 'oui',
                    'No'  => 'no',
                ], 'expanded' => true,
            ])
            ->add('bathrooms')
            //->add('createdAt')
            ->add('category', EntityType::class,[
                'class' => Category::class,
                'choice_label' => 'title',
            ])
            ->add('type', EntityType::class,[
                'class' => Type::class,
                'choice_label' => 'title',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Property::class,
        ]);
    }


    // public function getChoices()
    // {
    //     $choices = Property::HEAT;
    //     $output = [];
    //     foreach ($choices as $key => $value) {
    //         $output[$value] = $key;
    //     }
    //     return $output;
    // }
}

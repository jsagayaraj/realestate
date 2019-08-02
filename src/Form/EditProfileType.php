<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class EditProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $user = $options['user'];
        $builder
            ->add('firstname')
            ->add('lastname')
            ->add('email')
                        
            ->add('gender', ChoiceType::class,[                
                'choices' => [
                    'Monsieur' => 'Monsieur',
                    'Madame' => 'Madame',
                ], 'expanded' => true,
            ])
            ->add('address', TextareaType::class)
            ->add('city')
            ->add('postalCode', NumberType::class)
            ->add('phoneNumber')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
            'user' => null // modifier profile
            
        ]);
    }
}

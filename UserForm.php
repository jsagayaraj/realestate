<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname')
            ->add('lastname')
            ->add('email')
            ->add('password', PasswordType::class)
            ->add('confirmPassword', PasswordType::class)
            ->add('phoneNumber')
            ->add('gender', ChoiceType::class, [
                'choices'=>[
                    'male'=> true,
                    'female' => false
                ]
            ])
            ->add('address', TextareaType::class)
            ->add('city')
            ->add('postalCode')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}

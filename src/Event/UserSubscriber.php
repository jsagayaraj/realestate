<?php

namespace App\Event;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class UserSubscriber implements EventSubscriberInterface
{
 /**
  * @var \Swift_mailer
  */
 private $mailer;

 /**
  * @var \Twig_Environment
  */
 private $twig;

 //inject swift mailer service and template twig service
 public function __construct(\Swift_Mailer $mailer, \Twig_Environment $twig)
 {
   $this->mailer = $mailer;
   $this->twig = $twig;
 }

 public static function getSubscribedEvents()
 {
   return [
    UserRegisterEvent::NAME => 'onUserRegister'
   ];
 }

 public function onUserRegister(UserRegisterEvent $event)
 {
  //render the html file and  get the registered user info
  $body = $this->twig->render('emails/registration.html.twig', [
   'user' => $event->getRegisteredUser()
  ]);
   //send mail
   $message = (new \Swift_Message())
           ->setSubject('Welcome to Our site realestate')
           ->setFrom('realestate@realestate.com')
           ->setTo($event->getRegisteredUser()->getEmail())
           ->setBody($body, 'text/html');

        $this->mailer->send($message);
 }
}
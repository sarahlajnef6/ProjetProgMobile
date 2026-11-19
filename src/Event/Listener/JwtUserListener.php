<?php
namespace App\Event\Listener;
use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationSuccessEvent; 
class JwtUserListener
{
    public function onAuthenticationSuccess(AuthenticationSuccessEvent $event)
    {
        $data = $event->getData();
        $user = $event->getUser();
        $payload = $data;
        $payload['id'] = $user->getId();
        $payload['firstname'] = $user->getFirstname();
        $payload['lastname'] = $user->getLastname();
        $payload['email'] = $user->getEmail();
        $event->setData($payload);
    }
}
<?php

class ControllerCommonNewsletter extends Controller {

    public function index() {        

        $json = array();        
        
        $message = 'This email is sent automatically, please do not reply. \nThanks,\nASACA Team';
        
        $defaultSubject = 'Thanks you for visiting ASACA';
        
        //$theRequest = $this->request->get;
        $theRequest = $this->request->post;
        
        $email = isset($theRequest['email']) ? $theRequest['email'] : ''; 

        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            try {
                $this->sendEmail($email, $defaultSubject, $message);
                $json['success'] = $email . ' is added successfully';
            }
            catch(Exception $ex) {
                $json['failed'] = 'Error Message: ' .$ex->getMessage();
            }
        }   
        else{
            $json['invalid'] = $email . ' is invalid email';
        }
        //$json['error'] = 'System Error';
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    private function sendEmail($toEmail, $subject='', $message=''){
        $mail = new Mail($this->config->get('config_mail'));
        $mail->setTo($toEmail);
        $mail->setFrom($this->config->get('config_email'));
        $mail->setSender($this->config->get('config_name'));
        $mail->setSubject($subject);
        $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
        $mail->send();
    }    
}
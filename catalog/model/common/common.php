<?php

class ModelCommonCommon extends Model {
    
    public function addNewEmail($data){
        
        
        
        //$queryString = "INSERT INTO `". DB_PREFIX ."visitor_email` (`email`, `name`, `gender`, `active`, `date_added`, `date_modified`) ".
        //        "VALUES ('',null,null,null, NOW(), NOW())";
        //$query = $this->db->query($queryString);
        $queryString = "INSERT INTO `". DB_PREFIX ."visitor_email` (`email`, `name`, `gender`, `active`, `date_added`, `date_modified`) VALUES(";
                       $queryString .= "'". (isset($data['email']) ? $data['email'] : "") ."', ";
                       $queryString .= isset($data['name']) ? "'".$data['name']."', " : "null, ";
                       $queryString .= isset($data['gender']) ? "'".$data['gender']."', " : "null, ";
                       $queryString .= isset($data['active']) ? "'".$data['active']."', " : "null, ";
                       $queryString .= isset($data['date_added']) ? "'".$data['date_added']."', " : "NOW(), ";
                       $queryString .= isset($data['date_modified']) ? "'".$data['date_modified']."', " : "NOW()";
                       $queryString .= ")";
        return $this->db->query($queryString);               
    }
    
    public function findEmail($email){
        $queryString = "SELECT * FROM `".DB_PREFIX."visitor_email` em WHERE em.email='".$email."'";
        $query = $this->db->query($queryString);
        return $query->rows;
    }
}
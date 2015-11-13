<?php
/**
* @package     oauth2
* @author      xiaocao
* @link        http://homeway.me/
* @copyright   Copyright(c) 2015
* @version     15.6.29
**/

defined('BASEPATH') OR exit('No direct script access allowed');

class Authorize extends CI_Controller {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
    }

    function index(){
        $scope = $this->input->get("scope");
        $state = $this->input->get("state");
        $client_id = $this->input->get("client_id");
        $redirect_uri = $this->input->get("redirect_uri");
        $response_type = $this->input->get("response_type");

        if(!isset($_POST["authorized"])){
            $this->server->check_client_id();
            $data = array(
                "scope" => $scope,
                "state" => $state,
                "client_id" => $client_id,
                "redirect_uri" => $redirect_uri,
                "response_type" => $response_type,
            );
            $this->load->view("oauth2/authorize", $data);
        }else{
            $authorized = $this->input->post("authorized");
            if($authorized === "yes"){
                $this->server->authorize(($authorized === "yes"));
            }else{
                echo "error";
            }
        }
    }

    function token(){
        $this->server->authorization_code("yes");
    }
}

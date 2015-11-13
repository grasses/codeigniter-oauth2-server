<?php
/**
* @package     oauth2
* @author      xiaocao
* @link        http://homeway.me/
* @copyright   Copyright(c) 2015
* @version     15.6.25
**/

defined('BASEPATH') OR exit('No direct script access allowed');

class ClientCredentials extends CI_Controller {
    function __construct(){
        @session_start();
        parent::__construct();
        $this->load->library("Server", "server");
    }    

    function index(){
        $this->server->client_credentials();
    }
}

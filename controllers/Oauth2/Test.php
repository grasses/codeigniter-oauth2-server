<?php
/**
* @package     Test
* @author      xiaocao
* @link        http://homeway.me/
* @copyright   Copyright(c) 2015
* @version     15.6.25
**/

defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends CI_Controller {
    function __construct(){
        @session_start();
        parent::__construct();
    }

    function index(){
    	$this->load->view("oauth2/api");
    }

}

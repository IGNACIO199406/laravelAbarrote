<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
 class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function mensajeList(){
        $mensajeList=[
                        "registroExitoso"=>"Serealizo con exito el registro",
                        "loginExitoso"=>"Bienvenido usuario",
                        "registroError"=>"El registro esta duplicado",
                        "loginError"=>"Usuario o contrasena incorrectos",
                        "sistemaError"=>"Hay un error en el sistema",
                        "ajusteExitoso"=>"Serealizo con exito el ajuste",
                    ];

        return $mensajeList;
    }

    public function generadorClaves()
    {
        $str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        $password = "";
        $longitud = 10;
        //Reconstruimos la contraseña segun la longitud que se quiera
        for($i=0;$i<$longitud;$i++) {
           //obtenemos un caracter aleatorio escogido de la cadena de caracteres
           $password .= substr($str,rand(0,62),1);
        }
        return $password;
    }

    public function __construct(){
        $mensajeList=$this->mensajeList();
        $this->registroExitoso=$mensajeList["registroExitoso"];
        $this->loginExitoso=$mensajeList["loginExitoso"];
        $this->registroError=$mensajeList["registroError"];
        $this->loginError=$mensajeList["loginError"];
        $this->sistemaError=$mensajeList["sistemaError"];
        $this->ajusteExitoso=$mensajeList["ajusteExitoso"];
        $this->generadorClave=$this->generadorClaves();
    }
}

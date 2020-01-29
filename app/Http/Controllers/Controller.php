<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function mensajeList()
    {
        $mensajeList = [
            "registroExitoso" => "Serealizo con exito el registro",
            "loginExitoso" => "Bienvenido usuario",
            "registroError" => "El registro esta duplicado",
            "loginError" => "Usuario o contrasena incorrectos",
            "sistemaError" => "Hay un error en el sistema",
            "ajusteExitoso" => "Serealizo con exito el ajuste",
            "sessionPortKal" => "sessionPortKal",
            
        ];

        return $mensajeList;
    }

    public function generadorClaves()
    {
        $cadena_base =  'ABCDEFGHIJKLMNOPQRSTUVWXYZ'; //abcdefghijklmnopqrstuvwxyz';
        $cadena_base .= '0123456789';
        $largo = 10;
        $password = '';
        $limite = strlen($cadena_base) - 1;
        for ($i = 0; $i < $largo; $i++) {
            $password .= $cadena_base[rand(0, $limite)];
        }
        return $password;
    }

    public function __construct()
    {
        $mensajeList = $this->mensajeList();
        $this->registroExitoso = $mensajeList["registroExitoso"];
        $this->loginExitoso = $mensajeList["loginExitoso"];
        $this->registroError = $mensajeList["registroError"];
        $this->loginError = $mensajeList["loginError"];
        $this->sistemaError = $mensajeList["sistemaError"];
        $this->ajusteExitoso = $mensajeList["ajusteExitoso"];
        $this->sessionPortKal = $mensajeList["sessionPortKal"];
        $this->generadorClave = $this->generadorClaves();
    }
}

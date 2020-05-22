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
            "actualizoExitoso" => "Serealizo con exito la actualizacion del registro",
            "actualizoError" => "La actualizacion no se pudo realizar campos faltantes u duplicado de registro",
            "eliminoExitoso" => "Se elimino con exito el registro",
            "loginExitoso" => "Bienvenido usuario",
            "registroError" => "El registro esta duplicado",
            "loginError" => "Usuario o contrasena incorrectos",
            "ajusteExitoso" => "Serealizo con exito el ajuste",
            "sistemaError" => "Hay un error en el sistema",
            "sistemaExitoso" => "Secargo con exito el sistema",
            "ficheroError" => "El fichero no existe",
            "sessionSistema" => "sessionPortKal",
        ];

        return $mensajeList;
    }

    public function variablesGenerales(){
        $variablesGenerales = [
            "imagenGeneral" => "logo.png",
        ];
        return $variablesGenerales;
    }

    public function msgSistema(){
        $msgSistema =[
            "succes" => "Succes",
            "error" => "Error",
            "warning" => "Warning",
            "ok" => "Ok",
            "msg" => "Msg",
            "data" => "Data",
        ];
        return $msgSistema; 
    }

    public function campoTabla(){
        $campoTabla = [
            "nombreCampoTabla" => "nombre",
            "idRolCampoTabla" => "idRol",
            "idCatalogoCampoTabla" => "idCatalogo",
            "idUsuarioCampoTabla" => "idUsuario",
            "idAccionCampoTabla" => "idAccion",
            "statusCampoTabla" => "status",
            "idCampoTabla" => "id",
            "emailCampoTabla" => "email",
            "passwordCampoTabla" => "password",
            "contadorCampoTabla" => "contador",
            "archivoCampoTabla" => "archivo",
            "apellidoPaternoCampoTabla" => "apellidoPaterno",
            "apellidoMaternoCampoTabla" => "apellidoMaterno",
            "telefonoCampoTabla" => "telefono",
            "direccionCampoTabla" => "direccion",
        ];
        return $campoTabla; 
    }

    public function tabla(){
        $tabla = [
            "usuarioTabla" => "usuario",
            "clienteTabla" => "cliente",
            "proveedorTabla" => "proveedor",
            "sucursalTabla" => "sucursal",
            "estatusTabla" => "estatus",
            "portalTabla" => "portal",
            "catalogoTabla" => "catalogo",
            "marcaTabla" => "marca",
            "rolTabla" => "rol",
            "accionTabla" => "accion",
            "permisoTabla" => "permiso",
            "productoTabla" => "producto",
            "departamentoTabla" => "departamento",
            "agendaTabla" => "agenda",
            "diaTabla" => "dia",
            "ventaTabla" => "venta",
            "categoriaTabla" => "categoria",     
            "unidadTabla" => "unidad",
            "almacenTabla" => "almacen"
        ];
        return $tabla; 
    }

    public function generadorClaves()
    {
        $cadena_base =  'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
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
        $msgSistema = $this->msgSistema();
        $campoTabla = $this->campoTabla();
        $tabla = $this->tabla();
        $variablesGenerales = $this->variablesGenerales();

        $this->registroExitoso = $mensajeList["registroExitoso"];
        $this->loginExitoso = $mensajeList["loginExitoso"];
        $this->registroError = $mensajeList["registroError"];
        $this->loginError = $mensajeList["loginError"];
        $this->sistemaError = $mensajeList["sistemaError"];
        $this->sistemaExitoso = $mensajeList["sistemaExitoso"];
        $this->ajusteExitoso = $mensajeList["ajusteExitoso"];
        $this->ficheroError = $mensajeList["ficheroError"];
        $this->sessionSistema = $mensajeList["sessionSistema"];
        $this->actualizoExitoso = $mensajeList["actualizoExitoso"];
        $this->actualizoError = $mensajeList["actualizoError"];
        $this->eliminoExitoso = $mensajeList["eliminoExitoso"];

        $this->error = $msgSistema["error"];
        $this->succes = $msgSistema["succes"];
        $this->warning = $msgSistema["warning"];
        $this->ok = $msgSistema["ok"];
        $this->msg = $msgSistema["msg"];
        $this->data = $msgSistema["data"];

        $this->nombreCampoTabla = $campoTabla["nombreCampoTabla"];
        $this->idRolCampoTabla = $campoTabla["idRolCampoTabla"];
        $this->idCatalogoCampoTabla = $campoTabla["idCatalogoCampoTabla"];
        $this->idAccionCampoTabla = $campoTabla["idAccionCampoTabla"];
        $this->statusCampoTabla = $campoTabla["statusCampoTabla"];
        $this->idCampoTabla = $campoTabla["idCampoTabla"];
        $this->emailCampoTabla = $campoTabla['emailCampoTabla'];
        $this->passwordCampoTabla = $campoTabla['passwordCampoTabla'];
        $this->contadorCampoTabla = $campoTabla['contadorCampoTabla'];
        $this->idUsuarioCampoTabla = $campoTabla['idUsuarioCampoTabla'];
        $this->archivoCampoTabla = $campoTabla["archivoCampoTabla"];
        $this->apellidoPaternoCampoTabla = $campoTabla["apellidoPaternoCampoTabla"];
        $this->apellidoMaternoCampoTabla = $campoTabla["apellidoMaternoCampoTabla"];
        $this->telefonoCampoTabla = $campoTabla["telefonoCampoTabla"];
        $this->direccionCampoTabla = $campoTabla["direccionCampoTabla"];
        
        $this->usuarioTabla = $tabla["usuarioTabla"];
        $this->clienteTabla = $tabla["clienteTabla"];
        $this->proveedorTabla = $tabla["proveedorTabla"];
        $this->sucursalTabla = $tabla["sucursalTabla"];
        $this->estatusTabla = $tabla["estatusTabla"];
        $this->portalTabla = $tabla["portalTabla"];
        $this->catalogoTabla = $tabla["catalogoTabla"];
        $this->marcaTabla = $tabla["marcaTabla"];
        $this->rolTabla = $tabla["rolTabla"];
        $this->accionTabla = $tabla["accionTabla"];
        $this->permisoTabla = $tabla["permisoTabla"];
        $this->productoTabla = $tabla["productoTabla"];
        $this->departamentoTabla = $tabla["departamentoTabla"];
        $this->agendaTabla = $tabla["agendaTabla"];
        $this->diaTabla = $tabla["diaTabla"];
        $this->ventaTabla = $tabla["ventaTabla"];
        $this->categoriaTabla = $tabla["categoriaTabla"];
        $this->unidadTabla = $tabla["unidadTabla"];
        $this->almacenTabla = $tabla["almacenTabla"];

        $this->imagenGeneral = $variablesGenerales["imagenGeneral"];
        $this->generadorClave = $this->generadorClaves();
    }
}

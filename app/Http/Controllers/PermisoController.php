<?php

namespace App\Http\Controllers;

use App\RolesModel as modeladoRol;
use App\PermisosModel as modelado;
use App\CatalogoModel as modeladoCatalogo;
use App\AccionesModel as modeladoAccion;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PermisoController extends Controller
{
    public function index()
    {
        $datos = modeladoCatalogo::all();
        return view('permiso/permiso')->with('datos', $datos);
    }

    public function faltantePermiso()
    {
        try {
            $row = array();
            $consultaCatalogo = modeladoCatalogo::selectRaw('count(*) as contador')->first();
            $resulCatalogo = $consultaCatalogo["contador"];
            $consultaAccion = modeladoAccion::selectRaw('count(*) as contador')->first();
            $resulAccion = $consultaAccion["contador"];
            $totalRegistros = (1 * $resulAccion) * $resulCatalogo;
            $datos = modeladoRol::all();
            foreach ($datos as $dato) {
                $consultaPermiso = modelado::where("ID_Rol", "=", $dato->id)->selectRaw('count(*) as contador')->first();
                $resulPermiso = $consultaPermiso["contador"];
                if ($totalRegistros != $resulPermiso) {
                    $row[] = ["id" => $dato->id, "nombre" => $dato->nombre];
                }
            }
            $result =  $row;
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function ajustePermiso(Request $request, $ID)
    {
        try {

            $listaCatalogo = modeladoCatalogo::all();
            $listaAccion = modeladoAccion::all();
            $idRol = $ID;
            foreach ($listaCatalogo as $campoCatalogo) {
                foreach ($listaAccion as $campoAccion) {
                    $consultaPermiso = modelado::where("ID_Rol", "=", $idRol)
                        ->where("ID_Accion", "=", $campoAccion->id)
                        ->where("ID_Catalogo", "=", $campoCatalogo->id)
                        ->selectRaw('count(*) as contador')->first();
                    $resulPermiso = $consultaPermiso["contador"];
                    if ($resulPermiso == 0) {
                        $query = new modelado();
                        $query->ID_Accion = $campoAccion->id;
                        $query->ID_Catalogo = $campoCatalogo->id;
                        $query->ID_Rol = $idRol;
                        $query->status = '1';
                        $query->created_at = $query->freshTimestamp();
                        $query->save();
                    }
                }
            }
            $result = ["succes" => 'ok', "msg" => $this->ajusteExitoso];
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }


    public function list(Request $request)
    {
        try {
            $result =  modeladoRol::all();
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function detalle(Request $request, $ID)
    {

        try {
            $row = array();
            $query = modelado::where('ID_Rol', '=', $ID)->get();



            $listaCatalogo = modeladoCatalogo::all();
            $listaAccion = modeladoAccion::all();

            $listaRol = modeladoRol::where("id", "=", $ID)->first();
            $listaPermiso = modelado::where('ID_Rol', '=', $ID)->get();
            $consultaPermiso = modelado::where("ID_Rol", "=", $ID)->selectRaw('count(*) as contador')->first();
            $resulPermiso = $consultaPermiso["contador"];
            if ($resulPermiso!=0) {
                foreach ($listaCatalogo as $campoCatalogo) {
                    foreach ($listaAccion as $campoAccion) {
                        foreach ($listaPermiso as $campoPermiso) {
                            if ($campoCatalogo->id == $campoPermiso->ID_Catalogo and $campoAccion->id == $campoPermiso->ID_Accion) {
                                $status = $campoPermiso->status;
                                $idPermiso = $campoPermiso->id;
                            }
                        }
                        $accionArray[] = ["id"=>$idPermiso,"accion" => $campoAccion->nombre, "status" => $status];
                    }
                    $catalogoArray[] = ["catalogo" => $campoCatalogo->nombre, "accion" => $accionArray];
                    $accionArray = array();
                }
            }else{
                $catalogoArray = array();
            }


            $data = ["rol" => $listaRol['nombre'], "data" => $catalogoArray];
            $result = $data;
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }
}

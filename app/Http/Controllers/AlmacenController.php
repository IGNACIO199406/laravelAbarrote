<?php

namespace App\Http\Controllers;

use App\AlmacenesModel as modelado;
use App\MarcasModel as modeladoMarca;
use App\DepartamentosModel as modeladoDepartamento;
use App\UnidadesModel as modeladoUnidad;
use App\CatalogoModel as modeladoCatalogo;
use App\PermisosModel as modeladoPermiso;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class AlmacenController extends Controller
{
    public function index()
    {
        if(session()->has($this->sessionPortKal)){
        $sessionUsuario = session($this->sessionPortKal);
        $queryCatalogo = modeladoCatalogo::where("nombre", "=", "Producto")
                ->first();
            $queryPermiso = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario["idRol"])
                ->where("idAccion", "=", 1)
                ->where("idCatalogo", "=", $queryCatalogo["id"])
                ->first();
            $queryPermisos = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario["idRol"])
                ->Where("idCatalogo", "=", $queryCatalogo["id"])
                ->Where("idAccion", "!=", 1)
                ->get();
        $datos = modeladoCatalogo::all();
        return view('almacen/almacen')->with('datos', $datos)
            ->with('permisos', $queryPermisos);
        }else{
            return view('usuario/login'); 
            //return view('usuario/login'); 
        }
    }

    public function list(Request $request)
    {
        try {

            $result = modelado::select('producto.id','producto.nombre','almacen.stock')
            ->join('producto', function($query){
            $query->on('producto.id', '=', 'almacen.idProducto'); })->get();
            // })->where('usuarios.id', '=', 3)->get();

        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function update(Request $request)
    {
        try {

        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function delete(Request $request)
    {
        $ID = $request->input('eliminaID');
        $Status = $request->input('eliminaStatus');
        try {
            $query = modelado::where('id', '=', $ID)->first();
            if ($query == true) {
                $query->status = $Status;
                $query->updated_at = $query->freshTimestamp();
                $query->save();
            }
            $result = ["succes" => 'ok', "msg" => $this->registroExitoso];
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function detalle(Request $request, $ID)
    {

        try {
            $query = modelado::where('id', '=', $ID)->first();
            $result = $query;
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }
}

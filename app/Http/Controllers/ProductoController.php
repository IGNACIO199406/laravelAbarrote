<?php

namespace App\Http\Controllers;

use App\ProductosModel as modelado;
use App\MarcasModel as modeladoMarca;
use App\DepartamentosModel as modeladoDepartamento;
use App\UnidadesModel as modeladoUnidad;
use App\CatalogoModel as modeladoCatalogo;
use App\PermisosModel as modeladoPermiso;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ProductoController extends Controller
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
        $datosMarca = modeladoMarca::all();
        $datosUnidad = modeladoUnidad::all();
        $modeladoDepartamento = modeladoDepartamento::all();
        return view('producto/producto')->with('datos', $datos)
            ->with('marcas', $datosMarca)
            ->with('unidades', $datosUnidad)
            ->with('departamentos', $modeladoDepartamento)
            ->with('permisos', $queryPermisos);
        }else{
            return view('usuario/login'); 
            //return view('usuario/login'); 
        }
    }

    public function create(Request $request)
    {
        try {
            $nombre = $request->input('nombre');
            $idDepartamento = $request->input('idDepartamento');
            $idMarca = $request->input('idMarca');
            $idUnidad = $request->input('idUnidad');
            $stock = $request->input('stock');
            $precioCompra = $request->input('precioCompra');
            $precioVenta = $request->input('precioVenta');
            $descripcion = $request->input('descripcion');
            $codigoBarra = $request->input('codigoBarra');
            $file = $request->file('archivo');
            $archivo = empty($file) ? "logo.png" : $file->getClientOriginalName();
            $raiz = 'img';
            $carpeta = "producto";

            $rutaArhcivo = $raiz . "/" . $carpeta . "/" . $archivo;
            file_exists($raiz . "/" . $carpeta) ? "" : mkdir($raiz . "/" . $carpeta, 0755, true);
            if (file_exists($rutaArhcivo) == true && $archivo != "logo.png") {
                $result = ["succes" => 'error', "msg" => "El fichero $archivo existe "];
            } else {
                $result = array();
                $codigoBarra == '' ?
                    $consulta = modelado::where("nombre", "=", $nombre)
                    ->selectRaw('count(*) as contador')
                    ->first() : $consulta = modelado::where("nombre", "=", $nombre)
                    ->orWhere("codigoBarra", "=", $codigoBarra)
                    ->selectRaw('count(*) as contador')
                    ->first();

                $resul = $consulta["contador"];
                if ($resul == 0) {
                    $query = new modelado();
                    $query->nombre = $nombre;
                    $query->idDepartamento = (int) $idDepartamento;
                    $query->idMarca = (int) $idMarca;
                    $query->idUnidad = (int) $idUnidad;
                    $query->stock = (int) $stock;
                    $query->precioCompra = (float) $precioCompra;
                    $query->precioVenta = (float) $precioVenta;
                    $query->descripcion = (string) $descripcion;
                    $query->codigoBarra = (string) $codigoBarra;
                    $query->archivo = $archivo;
                    $query->status = '1';
                    $query->created_at = $query->freshTimestamp();
                    $query->save();
                    $result = ["succes" => 'ok', "msg" => $this->registroExitoso];
                    strcmp($archivo, "logo.png") ? $file->move($raiz . "/" . $carpeta, $archivo) : "";
                } else {
                    $result = ["succes" => 'error', "msg" => $this->registroError];
                }
            }
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function list(Request $request)
    {
        try {
            $result = modelado::all();
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function update(Request $request)
    {
        try {
            $id = $request->input('ID');
            $nombre = $request->input('nombre');
            $idDepartamento = $request->input('idDepartamento');
            $idMarca = $request->input('idMarca');
            $idUnidad = $request->input('idUnidad');
            $stock = $request->input('stock');
            $precioCompra = $request->input('precioCompra');
            $precioVenta = $request->input('precioVenta');
            $descripcion = $request->input('descripcion');
            $codigoBarra = $request->input('codigoBarra');
            $codigoBarra == '' ?
                    $consulta = modelado::where("nombre", "=", $nombre)
                    ->where("id","!=",$id)
                    ->selectRaw('count(*) as contador')
                    ->first() : $consulta = modelado::where("nombre", "=", $nombre)
                    ->where("id","!=",$id)
                    ->orWhere("codigoBarra", "=", $codigoBarra)
                    ->selectRaw('count(*) as contador')
                    ->first();
            $result = $consulta["contador"];
            if ($result == 0) {
                $query = modelado::where("id", "=", $id)
                    ->first();
                $query->nombre = $nombre;
                $query->idDepartamento = (int) $idDepartamento;
                $query->idMarca = (int) $idMarca;
                $query->idUnidad = (int) $idUnidad;
                $query->precioCompra = (float) $precioCompra;
                $query->precioVenta = (float) $precioVenta;
                $query->descripcion = (string) $descripcion;
                $query->codigoBarra = (string) $codigoBarra;
                $query->created_at = $query->freshTimestamp();
                $query->save();
                $result = ["succes" => 'ok', "msg" => $this->registroExitoso];
            } else {
                $result = ["succes" => 'error', "msg" => $this->registroError];
            }
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

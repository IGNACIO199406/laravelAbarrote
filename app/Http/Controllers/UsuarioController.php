<?php

namespace App\Http\Controllers;

use App\Usuarios as modelado;
use App\CatalogoModel as modeladoCatalogo;
use App\RolesModel as modeladoRol;
use App\PermisosModel as modeladoPermiso;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
class UsuarioController extends Controller
{
    
    public function index()
    {
        if(session()->has($this->sessionPortKal)){
            $sessionUsuario = session($this->sessionPortKal);
            //session()->forget($this->sessionPortKal);
            $queryCatalogo = modeladoCatalogo::where("nombre", "=", "Usuario")
                ->first();
            $queryPermiso = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario["idRol"])
                ->where("idAccion", "=", 1)
                ->where("idCatalogo", "=", $queryCatalogo["id"])
                ->first();
            $queryPermisos = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario["idRol"])
                ->Where("idCatalogo", "=", $queryCatalogo["id"])
                ->Where("idAccion", "!=", 1)
                ->get();
            if($queryPermiso["status"]=="1"){
                $datos = modeladoCatalogo::all();
                $Roles = modeladoRol::all();
                return view('usuario/usuario')->with('datos', $datos)->with('roles', $Roles)->with('permisos', $queryPermisos);
            }else{
                return redirect('usuario/closeLogin'); 
            }
            
        }else{
            return view('usuario/login'); 
            //return view('usuario/login'); 
        }
    }

    public function closeLogin()
    {
        session()->forget($this->sessionPortKal);
        return redirect('/usuario');
    }

    public function login(Request $request)
    {
        try {
            $result = array();
            $email = $request->input('email');
            $password = $request->input('password');
            $consulta = modelado::where("email", "=", $email)
                ->where("password", "=", $password)
                ->where("status", "=", 1)
                ->selectRaw('count(*) as contador')
                ->first();
            $resul = $consulta["contador"];
            if ($resul == 1) {
                $query = modelado::where("email", "=", $email)
                ->first();
                $sessionPortKal=["sessionPortKal"=>["idUsuario"=>$query["id"],"idRol"=>$query["idRol"]]];
                $sessionUsuario = session($sessionPortKal);
                $result = ["succes" => 'ok', "msg" => $this->loginExitoso];
            } else {
                $result = ["succes" => 'error', "msg" => $this->loginError];
            }
        } catch (\Exception $e) {
            $result = ["succes" => 'error', "msg" => $e->getMessage()];
        }
        return json_encode($result);
    }

    public function home()
    {
        if(session()->has($this->sessionPortKal)){
            return redirect('/usuario');
        }else{
            return view('usuario/login'); 
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        try {
            $date = Carbon::now();
            $fecha=$date->day.$date->month.$date->year;
            $file = $request->file('archivo');
            $idRol = $request->input('idRol');
            $nombre = $request->input('nombre');
            $apellidoPaterno = $request->input('apellidoPaterno');
            $apellidoMaterno = $request->input('apellidoMaterno');
            $telefono = $request->input('telefono');
            $email = $request->input('email');
            $password = $request->input('password');
            $direccion = $request->input('direccion');

            $archivo = empty($file) ? "logo.png" : $file->getClientOriginalName();
            $raiz = 'img';
            $carpeta = "usuario";
            $rutaArhcivo = $raiz . "/" . $carpeta . "/" . $archivo;
            file_exists($raiz . "/" . $carpeta) ? "" : mkdir($raiz . "/" . $carpeta, 0755, true);
            if (file_exists($rutaArhcivo) == true && $archivo != "logo.png") {
                $result = ["succes" => 'error', "msg" => "El fichero $archivo existe "];
            } else {
                $result = array();
                $generadorClave = $this->generadorClave;
                $consulta = modelado::where("email", "=", $email)
                    ->where("codigoBarra", "=", $generadorClave)
                    ->selectRaw('count(*) as contador')
                    ->first();
                $resul = $consulta["contador"];
                if ($resul == 0) {
                    $query = new modelado();
                    $query->idSucursal = 1;
                    $query->idPortal = 1;
                    $query->idRol = (int) $idRol;
                    $query->codigoBarra = (string) "OPE" .$fecha. $generadorClave;
                    $query->nombre = (string) $nombre;
                    $query->apellidoPaterno = (string) $apellidoPaterno;
                    $query->apellidoMaterno = (string) $apellidoMaterno;
                    $query->email = (string) $email;
                    $query->telefono = (string) $telefono;
                    $query->direccion = (string) $direccion;
                    $query->password = (string) $password;
                    $query->archivo = (string) $archivo;
                    $query->puntos = 0.0;
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
            $file = $request->file('archivo');
            $idRol = $request->input('idRol');
            $nombre = $request->input('nombre');
            $apellidoPaterno = $request->input('apellidoPaterno');
            $apellidoMaterno = $request->input('apellidoMaterno');
            $telefono = $request->input('telefono');
            $email = $request->input('email');
            $password = $request->input('password');
            $direccion = $request->input('direccion');
            $consulta = modelado::where("email", "=", $email)
                ->where("id", "!=", $id)
                ->selectRaw('count(*) as contador')
                ->first();
            $result = $consulta["contador"];
            if ($result == 0) {
                $query = modelado::where("id", "=", $id)
                    ->first();
                $query->nombre = $nombre;
                $query->idRol = (int) $idRol;
                $query->nombre = (string) $nombre;
                $query->apellidoPaterno = (string) $apellidoPaterno;
                $query->apellidoMaterno = (string) $apellidoMaterno;
                $query->email = (string) $email;
                $query->telefono = (string) $telefono;
                $query->direccion = (string) $direccion;
                $query->password = (string) $password;
                $query->updated_at = $query->freshTimestamp();
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

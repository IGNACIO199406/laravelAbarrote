<?php

namespace App\Http\Controllers;

use App\Usuarios as modelado;
use App\CatalogoModel as modeladoCatalogo;
use App\RolesModel as modeladoRol;
use App\PermisosModel as modeladoPermiso;
use Illuminate\Http\Request;
use Carbon\Carbon;
class UsuarioController extends Controller
{
    
    public function index()
    {
        if(session()->has($this->sessionSistema)){
            $sessionUsuario = session($this->sessionSistema);
            $queryCatalogo = modeladoCatalogo::where($this->nombreCampoTabla, "=", "Usuario")
                ->first();
            $queryPermiso = modeladoPermiso::where($this->idRolCampoTabla, "=", (int) $sessionUsuario[$this->idRolCampoTabla])
                ->where($this->idAccionCampoTabla, "=", 1)
                ->where($this->idCatalogoCampoTabla, "=", $queryCatalogo[$this->idCampoTabla])
                ->first();
            $queryPermisos = modeladoPermiso::where($this->idRolCampoTabla, "=", (int) $sessionUsuario[$this->idRolCampoTabla])
                ->Where($this->idCatalogoCampoTabla, "=", $queryCatalogo[$this->idCampoTabla])
                ->Where($this->idAccionCampoTabla, "!=", 1)
                ->get();
            if($queryPermiso[$this->statusCampoTabla]=="1"){
                $datos = modeladoCatalogo::all();
                $Roles = modeladoRol::all();
                return view('usuario/usuario')->with('datos', $datos)->with('roles', $Roles)->with('permisos', $queryPermisos);
            }else{
                return redirect('usuario/closeLogin'); 
            }
            
        }else{
            return view('usuario/login');
        }
    }

    public function closeLogin()
    {
        session()->forget($this->sessionSistema);
        return redirect('/');
    }

    public function login(Request $request)
    {
        try {
            $result = array();
            $email = $request->input($this->emailCampoTabla);
            $password = $request->input($this->passwordCampoTabla);
            $consulta = modelado::where($this->emailCampoTabla, "=", $email)
                ->where($this->passwordCampoTabla, "=", $password)
                ->where($this->statusCampoTabla, "=", 1)
                ->selectRaw($this->contadorGeneral)
                ->first();
            $resul = $consulta[$this->contadorCampoTabla];
            if ($resul == 1) {
                $query = modelado::where($this->emailCampoTabla, "=", $email)
                ->first();
                $sessionSistema=[$this->sessionSistema =>[$this->idUsuarioCampoTabla=>$query[$this->idCampoTabla],$this->idRolCampoTabla=>$query[$this->idRolCampoTabla]]];
                session($sessionSistema);
                $result = [$this->succes => $this->ok, $this->msg => $this->loginExitoso];
            } else {
                $result = [$this->succes => $this->error, $this->msg => $this->loginError];
            }
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $e->getMessage()];
        }
        return json_encode($result);
    }

    public function home()
    {
        if(session()->has($this->sessionSistema)){
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
            $file = $request->file($this->archivoCampoTabla);
            $idRol = $request->input($this->idRolCampoTabla);
            $nombre = $request->input($this->nombreCampoTabla);
            $apellidoPaterno = $request->input($this->apellidoPaternoCampoTabla);
            $apellidoMaterno = $request->input($this->apellidoMaternoCampoTabla);
            $telefono = $request->input($this->telefonoCampoTabla);
            $email = $request->input($this->emailCampoTabla);
            $password = $request->input($this->passwordCampoTabla);
            $direccion = $request->input($this->direccionCampoTabla);

            $archivo = empty($file) ? $this->imagenGeneral : $file->getClientOriginalName();
            $carpeta = "usuario";
            $rutaArhcivo = $this->raizImgGeneral . "/" . $carpeta . "/" . $archivo;
            file_exists($this->raizImgGeneral . "/" . $carpeta) ? "" : mkdir($this->raizImgGeneral . "/" . $carpeta, 0755, true);
            if (file_exists($rutaArhcivo) == $this->booleanTrueGeneral && $archivo != $this->imagenGeneral) {
                $result = [$this->succes => $this->error, $this->msg => $this->ficheroError];
            } else {
                $result = array();
                $generadorClave = $this->generadorClave;
                $consulta = modelado::where($this->emailCampoTabla, "=", $email)
                    ->where($this->codigoBarraCampoTabla, "=", $generadorClave)
                    ->selectRaw($this->contadorGeneral)
                    ->first();
                $resul = $consulta[$this->contadorCampoTabla];
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
                    $result = [$this->succes => $this->ok, $this->msg => $this->registroExitoso];
                    strcmp($archivo, $this->imagenGeneral) ? $file->move($this->raizImgGeneral . "/" . $carpeta, $archivo) : "";
                } else {
                    $result = [$this->succes => $this->error, $this->msg => $this->registroError];
                }
            }
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function list(Request $request)
    {
        try {
            $result = modelado::all();
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function update(Request $request)
    {
        try {
            $id = $request->input($this->idGeneral);
            $file = $request->file($this->archivoCampoTabla);
            $idRol = $request->input($this->idRolCampoTabla);
            $nombre = $request->input($this->nombreCampoTabla);
            $apellidoPaterno = $request->input($this->apellidoPaternoCampoTabla);
            $apellidoMaterno = $request->input($this->apellidoMaternoCampoTabla);
            $telefono = $request->input($this->telefonoCampoTabla);
            $email = $request->input($this->emailCampoTabla);
            $password = $request->input($this->passwordCampoTabla);
            $direccion = $request->input($this->direccionCampoTabla);
            $consulta = modelado::where($this->emailCampoTabla, "=", $email)
                ->where($this->idCampoTabla, "!=", $id)
                ->selectRaw($this->contadorGeneral)
                ->first();
            $result = $consulta[$this->contadorCampoTabla];
            if ($result == 0) {
                $query = modelado::where($this->idCampoTabla, "=", $id)
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
                $result = [$this->succes => $this->ok, $this->msg => $this->actualizoExitoso];
            } else {
                $result = [$this->succes => $this->error, $this->msg => $this->actualizoError];
            }
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function delete(Request $request)
    {
        $ID = $request->input($this->idGeneral);
        $Status = $request->input($this->statusCampoTabla);
        try {
            $query = modelado::where($this->idCampoTabla, '=', $ID)->first();
            if ($query == $this->booleanTrueGeneral) {
                $query->status = $Status;
                $query->updated_at = $query->freshTimestamp();
                $query->save();
            }
            $result = [$this->succes => $this->ok, $this->msg => $this->eliminiExitoso];
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $this->sistemaError];
        }
        return json_encode($result);
    }

    public function detalle(Request $request, $ID)
    {
        try {
            $query = modelado::where($this->idCampoTabla, '=', $ID)->first();
            $result = $query;
        } catch (\Exception $e) {
            $result = [$this->succes => $this->error, $this->msg => $this->sistemaError];
        }
        return json_encode($result);
    }
}

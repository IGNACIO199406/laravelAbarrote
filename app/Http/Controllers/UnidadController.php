<?php
namespace App\Http\Controllers;
use App\UnidadesModel as modelado;
use App\CatalogoModel as modeladoCatalogo;
use App\RolesModel as modeladoRol;
use App\PermisosModel as modeladoPermiso;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UnidadController extends Controller
{
    public function index()
    {
        if(session()->has($this->sessionUsuario)){
            $sessionUsuario = session($this->sessionUsuario);
           // session()->forget($this->sessionUsuario);
            $queryCatalogo = modeladoCatalogo::where("nombre", "=", "Unidad")
                ->first();
            $queryPermiso = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario)
                ->where("idAccion", "=", 1)
                ->where("idCatalogo", "=", $queryCatalogo["id"])
                ->first();
            $queryPermisos = modeladoPermiso::where("idRol", "=", (int) $sessionUsuario)
                ->Where("idCatalogo", "=", $queryCatalogo["id"])
                ->Where("idAccion", "!=", 1)
                ->get();
            if($queryPermiso["status"]=="1"){
                $datos = modeladoCatalogo::all();
                $Roles = modeladoRol::all();
                return view('unidad/unidad')->with('datos', $datos)->with('permisos', $queryPermisos);
            }else{
                return redirect('usuario/closeLogin'); 
            }
            
        }else{
            return view('usuario/login'); 
            //return view('usuario/login'); 
        }
    }

    public function create(Request $request)
    {
        try {
            $nombre = $request->input('Nombre');
            $file = $request->file('archivo');
            $archivo = empty($file) ? "logo.png" : $file->getClientOriginalName();
            $raiz = 'img';
            $carpeta = "unidad";
            $rutaArhcivo = $raiz . "/" . $carpeta . "/" . $archivo;
            file_exists($raiz . "/" . $carpeta) ? "" : mkdir($raiz . "/" . $carpeta, 0755, true);
            if (file_exists($rutaArhcivo) == true && $archivo != "logo.png") {
                $result = ["succes" => 'error', "msg" => "El fichero $archivo existe "];
            } else {
                $result = array();
                $consulta = modelado::where("nombre", "=", $nombre)
                    ->selectRaw('count(*) as contador')
                    ->first();
                $resul = $consulta["contador"];
                if ($resul == 0) {
                    $query = new modelado();
                    $query->nombre = $nombre;
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
            $nombre = $request->input('Nombre');
            $id = $request->input('ID');
            $consulta = modelado::where("nombre","=",$nombre)
                                ->where("id","!=",$id)
                                ->selectRaw('count(*) as contador')
                                ->first();
            $result=$consulta["contador"];
            if ($result == 0) {
                $query = modelado::where("id","=",$id)
                                ->first();
                $query->nombre = $nombre;
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

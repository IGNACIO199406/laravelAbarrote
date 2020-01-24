<?php
namespace App\Http\Controllers;
use App\Usuarios as modelado;
use App\CatalogoModel as modeladoCatalogo;
use App\RolesModel as modeladoRolesModel;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UsuarioController extends Controller
{
    public function index()
    {
        $datos = modeladoCatalogo::all();
        $Roles = modeladoRolesModel::all();
        return view('usuario/usuario')->with('datos', $datos)->with('roles', $Roles);
    }
    
    public function login(Request $request)
    {
        try {
            $result = array();   
            $email = $request->input('email');
            $password = $request->input('password');
            $consulta = modelado::where("email","=",$email)
                                ->where("password","=",$password)
                                ->where("status","=",1)
                                ->selectRaw('count(*) as contador')
                                ->first();
            $resul=$consulta["contador"];
            if($resul==1){
              $result = ["succes"=>'ok',"msg"=>$this->loginExitoso];
            }else{
              $result = ["succes"=>'error',"msg"=>$this->loginError];
            }
        } catch (\Exception $e) {
            $result = ["succes"=>'error',"msg"=>$e->getMessage()];
            }
        return json_encode($result) ;
    }   

    public function home()
    {
        return view('usuario/login');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        try {
            $nombre = $request->input('Nombre');
            $file = $request->file('archivo');
            $email = $request->input('email');
            $password = $request->input('password');
            $ID_Rol = $request->input('ID_Rol');
            $archivo = empty($file) ? "logo.png" : $file->getClientOriginalName();
            $raiz = 'img';
            $carpeta = "usuario";
            $rutaArhcivo = $raiz . "/" . $carpeta . "/" . $archivo;
            file_exists($raiz . "/" . $carpeta) ? "" : mkdir($raiz . "/" . $carpeta, 0755, true);
            if (file_exists($rutaArhcivo) == true && $archivo != "logo.png") {
                $result = ["succes" => 'error', "msg" => "El fichero $archivo existe "];
            } else {
                $result = array();
                $consulta = modelado::where("email", "=", $email)
                    ->selectRaw('count(*) as contador')
                    ->first();
                $resul = $consulta["contador"];
                if ($resul == 0) {
                    $query = new modelado();
                    $query->ID_Portal = 1;
                    $query->ID_Rol = $ID_Rol;
                    $query->nombre = $nombre;
                    $query->email = $email;
                    $query->password = $password;
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

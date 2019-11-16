<?php
namespace App\Http\Controllers;
use App\CatalogoModel as modelado;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class CatalogoController extends Controller
{
    public function index()
    {
        $datos = modelado::all();
        return view('catalogo/catalogo')->with('datos', $datos);
    }

    public function create(Request $request)
    {
        try {
            $nombre = $request->input('Nombre');
            $parent = $request->input('parent');
                $result = array();
                $consulta = modelado::where("nombre", "=", $nombre)
                    ->selectRaw('count(*) as contador')
                    ->first();
                $resul = $consulta["contador"];
                if ($resul == 0) {
                    $query = new modelado();
                    $query->nombre = $nombre;
                    $query->url = "";
                    $query->parent = $parent;
                    $query->status = '1';
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

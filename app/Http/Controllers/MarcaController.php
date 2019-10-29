<?php

namespace App\Http\Controllers;

use App\MarcasModel as modelado;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class MarcaController extends Controller
{

    public function index()
    {
        return view('marca/marca');
    }

    public function create(Request $request)
    {
        try {
            $nombre = $request->input('Nombre');
            $file = $request->file('archivo');
            $archivo = empty($file) ? "logo.png" : $file->getClientOriginalName();
            $raiz = 'img';
            $carpeta = "marca";
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

    public function update(Request $request, $id)
    {
        try {
            $usuario = modelado::where('id', '=', $id)->first();
            if ($usuario == true) {
                $usuario->nombre = 'pedro';
                $usuario->password = '12345678';
                $usuario->save();
            }
            $result = ["succes" => 'ok', "msg" => $this->registroExitoso];
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

    public function csv(Request $request)
    {
        if (file_exists("img/Marcas.csv")) {
            Excel::filter('chunk')->load('img/Marcas.csv')->chunk(250, function ($results) {
                foreach ($results as $row) {
                    // resultado
                }
                return "si hay";
            });
        } else {
            return "no hay";
        }
    }
}

//extra info
// $file = $request->file('image');
   
// //Display File Name
// echo 'File Name: '.$file->getClientOriginalName();
// echo '<br>';

// //Display File Extension
// echo 'File Extension: '.$file->getClientOriginalExtension();
// echo '<br>';

// //Display File Real Path
// echo 'File Real Path: '.$file->getRealPath();
// echo '<br>';

// //Display File Size
// echo 'File Size: '.$file->getSize();
// echo '<br>';

// //Display File Mime Type
// echo 'File Mime Type: '.$file->getMimeType();

// //Move Uploaded File
// $destinationPath = 'uploads';
// $file->move($destinationPath,$file->getClientOriginalName());

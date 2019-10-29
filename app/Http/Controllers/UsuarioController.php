<?php

namespace App\Http\Controllers;
use App\Usuarios; 
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UsuarioController extends Controller
{
    /**
     * Display a listing of thssse resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      return view('usuario/usuario');
    }
    
    public function login(Request $request)
    {
        try {
            $result = array();   
            $email = $request->input('email');
            $password = $request->input('password');
            $consulta = Usuarios::where("email","=",$email)
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
            $result = array();   
            $correo = $request->input('Correo');
            $nombre = $request->input('Nombre');
            $consulta = Usuarios::where("email","=",$correo)
                                ->selectRaw('count(*) as contador')
                                ->first();
            $resul=$consulta["contador"];
            if($resul==0){
                $usuario = new Usuarios();
                $usuario->id_status=1;
                $usuario->nombre=$nombre;
                $usuario->email=$correo;
                $usuario->password='12345678';
                $usuario->status='1';
                $usuario->created_at='2019-09-10 00:00:00';
                
                $usuario->save();
                $result = ["succes"=>'ok',"msg"=>$this->registroExitoso];
            }else{
                $result = ["succes"=>'error',"msg"=>$this->registroError];
            }

        } catch (\Exception $e) {
        $result = ["succes"=>'error',"msg"=>$e->getMessage()];
        }
        return json_encode($result);  
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        return Usuarios::all();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id=5)
    {
        try {
            $usuario=Usuarios::where('id','=',$id)->first();
            if($usuario==true){
               $usuario->nombre='pedro';
               $usuario->password='12345678';
               $usuario->save();
            }
            $result = ["succes"=>'ok',"msg"=>$this->registroExitoso];
        } catch (\Exception $e) {
                $result = ["succes"=>'error',"msg"=>$e->getMessage()];
            }
            return json_encode($result);  
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id=5)
    {
        try {
            $usuario=Usuarios::where('id','=',$id)->first();
            if($usuario==true){
                $usuario->status='0';
                $usuario->save();
            }
            $result = ["succes"=>'ok',"msg"=>$this->registroExitoso];
        } catch (\Exception $e) {
                 $result = ["succes"=>'error',"msg"=>$e->getMessage()];
            }
            return json_encode($result);   
    }
}

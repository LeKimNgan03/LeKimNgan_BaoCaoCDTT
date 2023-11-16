<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Config;
use Illuminate\Support\Facades\Auth;

class ConfigController extends Controller
{
    public function index() {
        $config = Config::first();
        return view('backend.config.index', compact('config'));
    }

    public function createorupdate(Request $request)
    {
        if ($request->id==""){
            $config = new Config();
            $config->created_at = date('Y-m-d H-i-s');
            $config->created_by= Auth::id()??1;
        }else{
            $id = $request->id;
            $config = Config::find($id);
            $config->updated_at = date('Y-m-d H-i-s');
            $config->updated_by= Auth::id()??1;
        }
        $config->author=$request->author;
        $config->email=$request->email;
        $config->phone=$request->phone;
        $config->zalo=$request->zalo;
        $config->facebook=$request->facebook;
        $config->address=$request->address;
        $config->youtube=$request->youtube;
        $config->metadesc=$request->metadesc;
        $config->metakey=$request->metakey;
        $config->status=$request->status;
        $config->save();
        toastr()->success('Lưu sự thay đổi thành công!', 'Thông báo');
        return redirect()->route('config.index');
    }
}

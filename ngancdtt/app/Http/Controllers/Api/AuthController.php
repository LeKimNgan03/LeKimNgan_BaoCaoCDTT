<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        return view('backend.auth.login');
    }

    public function postlogin(Request $request)
    {
        $username = $request->username;
        $password = $request->password;
        $data = [
            'password' => $password,
            'roles' => 'admin'
        ];
        if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
            $data['email'] = $username;
        } else {
            $data['username'] = $username;
        }
        if (Auth::attempt($data)) {
            return redirect()->route('admin.dashboard');
        }
        $error = 'Thông tin đăng nhập không chính xác';
        return view('backend.auth.login', compact('error'));
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.login');
    }
}

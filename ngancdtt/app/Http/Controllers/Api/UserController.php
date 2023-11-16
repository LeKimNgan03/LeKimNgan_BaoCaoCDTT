<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function trash()
    {
        $users = User::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'users' => $users],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $user = User::find($id);
        $user->trash = '1';
        $user->save();
        if ($user == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'users' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
    }

    public function restore(Request $request, $id)
    {
        $user = User::find($id);
        $user->trash = '0';
        $user->save();
        if ($user == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'users' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
    }

    public function index()
    {
        $users = User::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'users' => $users],
            200
        );
    }

    public function show($id)
    {
        $user = User::find($id);
        if ($user == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'user' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'user' => $user],
            200
        );
    }

    public function store(Request $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->username = $request->username;
        $user->password = $request->password;
        $user->gender = $request->gender;
        $user->roles = $request->roles;
        $user->address = $request->address;
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->name . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->created_at = date('Y-m-d H:i:s');
        $user->created_by = 1;
        $user->status = $request->status;
        $user->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->username = $request->username;
        $user->password = $request->password;
        $user->gender = $request->gender;
        $user->roles = $request->roles;
        $user->address = $request->address;
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->name . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->updated_at = date('Y-m-d H:i:s');
        $user->updated_by = 1;
        $user->status = $request->status;
        $user->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            200
        );
    }

    public function destroy($id)
    {
        $user = User::find($id);
        if ($user == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $user->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }
}

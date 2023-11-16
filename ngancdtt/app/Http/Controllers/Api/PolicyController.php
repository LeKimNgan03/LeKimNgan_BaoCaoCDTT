<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Policy;
use Illuminate\Support\Str;

class PolicyController extends Controller
{
    public function trash()
    {
        $policies = Policy::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'policies' => $policies],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $policy = Policy::find($id);
        $policy->trash = '1';
        $policy->save();
        if ($policy == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'policies' => null],
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
        $policy = Policy::find($id);
        $policy->trash = '0';
        $policy->save();
        if ($policy == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'policies' => null],
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
        $policies = Policy::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'policies' => $policies],
            200
        );
    }

    public function show($id)
    {
        $policy = Policy::find($id);
        if ($policy == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'policy' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'policy' => $policy],
            200
        );
    }

    public function store(Request $request)
    {
        $policy = new Policy();
        $policy->title = $request->title;
        $policy->subtitle = $request->subtitle;
        $policy->detail = $request->detail;
        $policy->slug = Str::of($request->title)->slug('-');
        $policy->created_at = date('Y-m-d H:i:s');
        $policy->created_by = 1;
        $policy->status = $request->status;
        $policy->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $policy],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $policy = Policy::find($id);
        $policy->title = $request->title;
        $policy->subtitle = $request->subtitle;
        $policy->detail = $request->detail;
        $policy->slug = Str::of($request->title)->slug('-');
        $policy->updated_at = date('Y-m-d H:i:s');
        $policy->updated_by = 1;
        $policy->status = $request->status;
        $policy->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $policy],
            200
        );
    }

    public function destroy($id)
    {
        $policy = Policy::find($id);
        if ($policy == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $policy->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }
}

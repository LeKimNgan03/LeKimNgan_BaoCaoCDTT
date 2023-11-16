<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Menu;
use Illuminate\Support\Str;

class MenuController extends Controller
{
    public function trash()
    {
        $menus = Menu::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'menus' => $menus],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $menu = Menu::find($id);
        $menu->trash = '1';
        $menu->save();
        if ($menu == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'menus' => null],
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
        $menu = Menu::find($id);
        $menu->trash = '0';
        $menu->save();
        if ($menu == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'menus' => null],
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
        $menus = Menu::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'menus' => $menus],
            200
        );
    }

    public function show($id)
    {
        $menu = Menu::find($id);
        if ($menu == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'menu' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'menu' => $menu],
            200
        );
    }

    public function store(Request $request)
    {
        $menu = new Menu();
        $menu->name = $request->name;
        $menu->link = $request->link;
        $menu->type = $request->type;
        $menu->position = $request->position;
        $menu->parent_id = $request->parent_id;
        $menu->sort_order = $request->sort_order;
        $menu->created_at = date('Y-m-d H:i:s');
        $menu->created_by = 1;
        $menu->status = $request->status;
        $menu->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $menu],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $menu = Menu::find($id);
        $menu->name = $request->name;
        $menu->link = $request->link;
        $menu->type = $request->type;
        $menu->position = $request->position;
        $menu->parent_id = $request->parent_id;
        $menu->sort_order = $request->sort_order;
        $menu->updated_at = date('Y-m-d H:i:s');
        $menu->updated_by = 1;
        $menu->status = $request->status;
        $menu->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $menu],
            200
        );
    }

    public function destroy($id)
    {
        $menu = Menu::find($id);
        if ($menu == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $menu->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }

    public function menu_list($position, $parent_id = 0)
    {
        $args = [
            ['position', '=', $position],
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $menus = Menu::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        if (count($menus)) {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'menus' => $menus
                ],
                200
            );
        } else {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không có dữ liệu',
                    'menus' => null
                ],
                200
            );
        }
    }
}

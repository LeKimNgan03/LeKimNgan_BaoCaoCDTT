<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function trash()
    {
        $categories = Category::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'categories' => $categories],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $category = Category::find($id);
        $category->trash = '1';
        $category->save();
        if ($category == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'categories' => null],
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
        $category = Category::find($id);
        $category->trash = '0';
        $category->save();
        if ($category == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'categories' => null],
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
        $categories = Category::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'categories' => $categories],
            200
        );
    }

    public function show($id)
    {
        if (is_numeric($id)) {
            $category = Category::find($id);
        } else {
            $category = Category::where('slug', $id)->first();
        }
        if ($category == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'category' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'category' => $category],
            200
        );
    }

    public function store(Request $request)
    {
        $category = new Category();
        $category->name = $request->name;
        $category->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->name . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        $category->sort_order = $request->sort_order;
        $category->metakey = $request->metakey;
        $category->metadesc = $request->metadesc;
        $category->parent_id = $request->parent_id;
        $category->created_at = date('Y-m-d H:i:s');
        $category->created_by = 1;
        $category->status = $request->status;
        $category->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $category],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        $category->name = $request->name;
        $category->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->name . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        $category->sort_order = $request->sort_order;
        $category->metakey = $request->metakey;
        $category->metadesc = $request->metadesc;
        $category->parent_id = $request->parent_id;
        $category->updated_at = date('Y-m-d H:i:s');
        $category->updated_by = 1;
        $category->status = $request->status;
        $category->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $category],
            200
        );
    }

    public function destroy($id)
    {
        $category = Category::find($id);
        if ($category == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $category->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }

    public function category_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $categories = Category::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'categories' => $categories
            ],
            200
        );
    }
}

<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Support\Str;

class BrandController extends Controller
{
    public function trash()
    {
        $brands = Brand::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'brands' => $brands],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $brand = Brand::find($id);
        $brand->trash = '1';
        $brand->save();
        if ($brand == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'brands' => null],
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
        $brand = Brand::find($id);
        $brand->trash = '0';
        $brand->save();
        if ($brand == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'brands' => null],
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
        $brands = Brand::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'brands' => $brands],
            200
        );
    }

    public function show($id)
    {
        // $brand = Brand::find($id);
        if (is_numeric($id)) {
            $brand = Brand::findOrFail($id);
        } else {
            $brand = Brand::where('slug', $id)->first();
        }
        if ($brand == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'brand' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'brand' => $brand],
            200
        );
    }

    public function store(Request $request)
    {
        $brand = new Brand();
        $brand->name = $request->name;
        $brand->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $brand->name . '.' . $extension;
                $brand->image = $filename;
                $files->move(public_path('images/brand'), $filename);
            }
        }
        $brand->sort_order = $request->sort_order;
        $brand->metakey = $request->metakey;
        $brand->metadesc = $request->metadesc;
        $brand->created_at = date('Y-m-d H:i:s');
        $brand->created_by = 1;
        $brand->status = $request->status;
        $brand->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $brand],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);
        $brand->name = $request->name;
        $brand->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $brand->name . '.' . $extension;
                $brand->image = $filename;
                $files->move(public_path('images/brand'), $filename);
            }
        }
        $brand->sort_order = $request->sort_order;
        $brand->metakey = $request->metakey;
        $brand->metadesc = $request->metadesc;
        $brand->updated_at = date('Y-m-d H:i:s');
        $brand->updated_by = 1;
        $brand->status = $request->status;
        $brand->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $brand],
            200
        );
    }

    public function destroy($id)
    {
        $brand = Brand::find($id);
        if ($brand == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $brand->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
    }
}

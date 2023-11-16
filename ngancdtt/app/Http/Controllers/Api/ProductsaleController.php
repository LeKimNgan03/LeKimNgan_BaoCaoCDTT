<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\Productsale;
use Illuminate\Support\Str;

class ProductsaleController extends Controller
{
    public function trash()
    {
        $productsales = Productsale::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'productsales' => $productsales],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $productsale = Productsale::find($id);
        $productsale->trash = '1';
        $productsale->save();
        if ($productsale == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'productsales' => null],
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
        $productsale = Productsale::find($id);
        $productsale->trash = '0';
        $productsale->save();
        if ($productsale == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'productsales' => null],
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
        $productsales = Productsale::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'productsales' => $productsales],
            200
        );
    }

    public function show($id)
    {
        $productsale = Productsale::find($id);
        if ($productsale == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', '  productsale' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'productsale' => $productsale],
            200
        );
    }

    public function store(Request $request)
    {
        $productsale = new Productsale();
        $productsale->product_id = $request->product_id;
        $productsale->pricesale = $request->pricesale;
        $productsale->qty = $request->qty;
        $productsale->date_begin = date('Y-m-d H:i:s');
        $productsale->date_end = date('Y-m-d H:i:s');
        $productsale->created_at = date('Y-m-d H:i:s');
        $productsale->created_by = 1;
        $productsale->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $productsale],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $productsale = Productsale::find($id);
        $productsale->product_id = $request->product_id;
        $productsale->pricesale = $request->pricesale;
        $productsale->qty = $request->qty;
        $productsale->date_begin = date('Y-m-d H:i:s');
        $productsale->date_end = date('Y-m-d H:i:s');
        $productsale->updated_at = date('Y-m-d H:i:s');
        $productsale->updated_by = 1;
        $productsale->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $productsale],
            200
        );
    }

    public function destroy($id)
    {
        $productsale = Productsale::find($id);
        if ($productsale == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $productsale->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }
}

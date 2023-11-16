<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Orderdetail;
use Illuminate\Support\Str;

class OrderdetailController extends Controller
{
    public function trash()
    {
        $orderdetails = Orderdetail::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'orderdetails' => $orderdetails],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $orderdetail = Orderdetail::find($id);
        $orderdetail->trash = '1';
        $orderdetail->save();
        if ($orderdetail == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'orderdetails' => null],
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
        $orderdetail = Orderdetail::find($id);
        $orderdetail->trash = '0';
        $orderdetail->save();
        if ($orderdetail == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'orderdetails' => null],
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
        $orderdetails = Orderdetail::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'orderdetails' => $orderdetails],
            200
        );
    }

    public function show($id)
    {
        $orderdetail = Orderdetail::find($id);
        if ($orderdetail == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'orderdetail' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'orderdetail' => $orderdetail],
            200
        );
    }

    public function store(Request $request)
    {
        $orderdetail = new Orderdetail();
        $orderdetail->order_id = $request->order_id;
        $orderdetail->product_id = $request->product_id;
        $orderdetail->price = $request->price;
        $orderdetail->qty = $request->qty;
        $orderdetail->discount = $request->discount;
        $orderdetail->amount = $request->amount;
        $orderdetail->note = $request->note;
        $orderdetail->created_at = date('Y-m-d H:i:s');
        $orderdetail->created_by = 1;
        $orderdetail->status = $request->status;
        $orderdetail->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $orderdetail],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $orderdetail = Orderdetail::find($id);
        $orderdetail->order_id = $request->order_id;
        $orderdetail->product_id = $request->product_id;
        $orderdetail->price = $request->price;
        $orderdetail->qty = $request->qty;
        $orderdetail->discount = $request->discount;
        $orderdetail->amount = $request->amount;
        $orderdetail->note = $request->note;
        $orderdetail->updated_at = date('Y-m-d H:i:s');
        $orderdetail->updated_by = 1;
        $orderdetail->status = $request->status;
        $orderdetail->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $orderdetail],
            200
        );
    }

    public function destroy($id)
    {
        $orderdetail = Orderdetail::find($id);
        if ($orderdetail == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $orderdetail->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'data' => $orderdetail], 200);
    }
}

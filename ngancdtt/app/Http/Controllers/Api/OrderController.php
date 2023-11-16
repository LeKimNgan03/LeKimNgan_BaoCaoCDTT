<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function trash()
    {
        $orders = Order::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'orders' => $orders],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $order = Order::find($id);
        $order->trash = '1';
        $order->save();
        if ($order == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'orders' => null],
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
        $order = Order::find($id);
        $order->trash = '0';
        $order->save();
        if ($order == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'orders' => null],
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
        $orders = Order::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'orders' => $orders],
            200
        );
    }

    public function show($id)
    {
        $order = Order::find($id);
        if ($order == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'order' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'order' => $order],
            200
        );
    }

    public function store(Request $request)
    {
        $order = new Order();
        $order->user_id = $request->user_id;
        $order->delivery_name = $request->delivery_name;
        $order->delivery_email = $request->delivery_email;
        $order->delivery_phone = $request->delivery_phone;
        $order->delivery_gender = $request->delivery_gender;
        $order->delivery_address = $request->delivery_address;
        $order->note = $request->note;
        $order->created_at = date('Y-m-d H:i:s');
        $order->created_by = 1;
        $order->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $order],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $order->user_id = $request->user_id;
        $order->delivery_name = $request->delivery_name;
        $order->delivery_email = $request->delivery_email;
        $order->delivery_phone = $request->delivery_phone;
        $order->delivery_gender = $request->delivery_gender;
        $order->delivery_address = $request->delivery_address;
        $order->note = $request->note;
        $order->updated_at = date('Y-m-d H:i:s');
        $order->updated_by = 1;
        $order->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $order],
            200
        );
    }

    public function destroy($id)
    {
        $order = Order::find($id);
        if ($order == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $order->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }
}

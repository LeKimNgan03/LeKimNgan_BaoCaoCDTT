<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use Illuminate\Support\Str;

class SliderController extends Controller
{
    public function trash()
    {
        $sliders = Slider::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'sliders' => $sliders],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $slider = Slider::find($id);
        $slider->trash = '1';
        $slider->save();
        if ($slider == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'sliders' => null],
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
        $slider = Slider::find($id);
        $slider->trash = '0';
        $slider->save();
        if ($slider == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'sliders' => null],
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
        $sliders = Slider::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'sliders' => $sliders],
            200
        );
    }

    public function show($id)
    {
        $slider = Slider::find($id);
        if ($slider == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'slider' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'slider' => $slider],
            200
        );
    }

    public function store(Request $request)
    {
        $slider = new Slider();
        $slider->name = $request->name;
        $slider->link = $request->link;
        $slider->position = $request->position;
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->name . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->created_at = date('Y-m-d H:i:s');
        $slider->created_by = 1;
        $slider->status = $request->status;
        $slider->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $slider = Slider::find($id);
        $slider->name = $request->name;
        $slider->link = $request->link;
        $slider->position = $request->position;
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->name . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->updated_at = date('Y-m-d H:i:s');
        $slider->updated_by = 1;
        $slider->status = $request->status;
        $slider->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            200
        );
    }

    public function destroy($id)
    {
        $slider = Slider::find($id);
        if ($slider == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $slider->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }

    public function slider_list($position)
    {
        $args = [
            ['position', '=', $position],
            ['status', '=', 1]
        ];
        $sliders = Slider::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'sliders' => $sliders],
            200
        );
    }
}

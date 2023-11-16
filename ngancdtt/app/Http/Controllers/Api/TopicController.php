<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Topic;
use Illuminate\Support\Str;

class TopicController extends Controller
{
    public function trash()
    {
        $topics = Topic::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'topics' => $topics],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $topic = Topic::find($id);
        $topic->trash = '1';
        $topic->save();
        if ($topic == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'topics' => null],
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
        $topic = Topic::find($id);
        $topic->trash = '0';
        $topic->save();
        if ($topic == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'topics' => null],
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
        $topics = Topic::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'topics' => $topics],
            200
        );
    }

    public function show($id)
    {
        if (is_numeric($id)) {
            $topic = Topic::find($id);
        } else {
            $topic = Topic::where('slug', $id)->first();
        }
        if ($topic == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'topic' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'topic' => $topic],
            200
        );
    }

    public function store(Request $request)
    {
        $topic = new Topic();
        $topic->name = $request->name;
        $topic->slug = Str::of($request->name)->slug('-');
        $topic->metadesc = $request->metadesc;
        $topic->metakey = $request->metakey;
        $topic->parent_id = $request->parent_id;
        $topic->created_at = date('Y-m-d H:i:s');
        $topic->created_by = 1;
        $topic->status = $request->status;
        $topic->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $topic = Topic::find($id);
        $topic->name = $request->name;
        $topic->slug = Str::of($request->name)->slug('-');
        $topic->metakey = $request->metakey;
        $topic->metadesc = $request->metadesc;
        $topic->parent_id = $request->parent_id;
        $topic->updated_at = date('Y-m-d H:i:s');
        $topic->updated_by = 1;
        $topic->status = $request->status;
        $topic->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            200
        );
    }

    public function destroy($id)
    {
        $topic = Topic::find($id);
        if ($topic == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $topic->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }

    public function topic_list($parent_id)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $topics = Topic::where($args)
            // ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'topics' => $topics
            ],
            200
        );
    }
}

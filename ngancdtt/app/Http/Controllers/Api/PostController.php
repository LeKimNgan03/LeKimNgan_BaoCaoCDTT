<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Topic;
use App\Models\Post;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function trash()
    {
        $posts = Post::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'posts' => $posts],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $post = Post::find($id);
        $post->trash = '1';
        $post->save();
        if ($post == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'posts' => null],
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
        $post = Post::find($id);
        $post->trash = '0';
        $post->save();
        if ($post == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'posts' => null],
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
        $posts = Post::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'posts' => $posts],
            200
        );
    }

    public function show($id)
    {
        $post = Post::find($id);
        if ($post == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'post' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'post' => $post],
            200
        );
    }

    public function store(Request $request)
    {
        $post = new Post();
        $post->topic_id = $request->topic_id;
        $post->title = $request->title;
        $post->detail = $request->detail;
        $post->type = $request->type;
        $post->slug = Str::of($request->title)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $post->slug . '.' . $extension;
                $post->image = $filename;
                $files->move(public_path('images/post'), $filename);
            }
        }
        $post->metakey = $request->metakey;
        $post->metadesc = $request->metadesc;
        $post->created_at = date('Y-m-d H:i:s');
        $post->created_by = 1;
        $post->status = $request->status;
        $post->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        $post->topic_id = $request->topic_id;
        $post->title = $request->title;
        $post->detail = $request->detail;
        $post->type = $request->type;
        $post->slug = Str::of($request->title)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $post->slug . '.' . $extension;
                $post->image = $filename;
                $files->move(public_path('images/post'), $filename);
            }
        }
        $post->metakey = $request->metakey;
        $post->metadesc = $request->metadesc;
        $post->updated_at = date('Y-m-d H:i:s');
        $post->updated_by = 1;
        $post->status = $request->status;
        $post->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            200
        );
    }

    public function destroy($id)
    {
        $post = Post::find($id);
        if ($post == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $post->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }

    function post_list($type)
    {
        $args = [
            ['type', '=', $type],
            ['status', '=', 1]
        ];
        $posts = Post::where($args)
            ->orderBy('created_at', 'DESC')
            //->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }

    public function post_all($limit, $page = 1)
    {
        $offset = ($page - 1) * $limit;
        $posts = Post::where('status', 1)
            ->orderBy('created_at', 'DESC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        if (count($posts) > 0) {
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'posts' => $posts
                ],
                200
            );
        } else {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Tải dữ liệu thành công',
                    'posts' => null
                ],
                200
            );
        }
    }

    public function post_detail($id)
    {
        $post = Post::where([
            ['id', '=', $id],
            ['status', '=', 1]
        ])->first();
        if ($post == null) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không tìm thấy dữ liệu',
                    'post' => null
                ],
                404
            );
        }
        $listid = array();
        array_push($listid, $post->topic_id + 0);
        $args_topic1 = [
            ['parent_id', '=', $post->topic_id + 0],
            ['status', '=', 1]
        ];
        $list_topic1 = Topic::where($args_topic1)->get();
        if (count($list_topic1) > 0) {
            foreach ($list_topic1 as $row1) {
                array_push($listid, $row1->id);
                $args_topic2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_topic2 = Topic::where($args_topic2)->get();
                if (count($list_topic2) > 0) {
                    foreach ($list_topic2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $post_other = Post::where([
            ['id', '!=', $post->id],
            ['status', '=', 1]
        ])
            ->whereIn('topic_id', $listid)
            ->orderBy('created_at', 'DESC')
            ->limit(4)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'post' => $post,
                'post_other' => $post_other,
            ],
            200
        );
    }

    public function post_topic($topic_id, $page = 1)
    {
        $listid = array();
        array_push($listid, $topic_id + 0);
        $args_topic1 = [
            ['parent_id', '=', $topic_id + 0],
            ['status', '=', 1]
        ];
        $list_topic1 = Topic::where($args_topic1)->get();
        if (count($list_topic1) > 0) {
            foreach ($list_topic1 as $row1) {
                array_push($listid, $row1->id);
                $args_topic2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_topic2 = Topic::where($args_topic2)->get();
                if (count($list_topic2) > 0) {
                    foreach ($list_topic2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        // $offset = ($page - 1) * $limit;
        $posts = Post::where('status', 1)
            ->whereIn('topic_id', $listid)
            ->orderBy('created_at', 'DESC')
            // ->offset($offset)
            // ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }
}

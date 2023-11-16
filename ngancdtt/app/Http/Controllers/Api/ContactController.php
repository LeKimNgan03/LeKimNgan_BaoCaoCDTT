<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;
use Illuminate\Support\Str;

class ContactController extends Controller
{
    public function trash()
    {
        $contacts = Contact::where('trash', 1)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'contacts' => $contacts],
            200
        );
    }

    public function sortdelete(Request $request, $id)
    {
        $contact = Contact::find($id);
        $contact->trash = '1';
        $contact->save();
        if ($contact == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'contacts' => null],
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
        $contact = Contact::find($id);
        $contact->trash = '0';
        $contact->save();
        if ($contact == null) {
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'contacts' => null],
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
        $contacts = Contact::where('trash', 0)
            ->orderBy('created_at', 'DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'contacts' => $contacts],
            200
        );
    }

    public function show($id)
    {
        $contact = Contact::find($id);
        if ($contact == null) {
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'contact' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'contact' => $contact],
            200
        );
    }

    public function store(Request $request)
    {
        $contact = new Contact();
        $contact->name = $request->name;
        $contact->email = $request->email;
        $contact->content = $request->content;
        $contact->created_at = date('Y-m-d H:i:s');
        $contact->created_by = 1;
        $contact->status = $request->status;
        $contact->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            201
        );
    }

    public function update(Request $request, $id)
    {
        $contact = Contact::find($id);
        $contact->name = $request->name;
        $contact->email = $request->email;
        $contact->content = $request->content;
        $contact->updated_at = date('Y-m-d H:i:s');
        $contact->updated_by = 1;
        $contact->status = $request->status;
        $contact->save();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            200
        );
    }

    public function destroy($id)
    {
        $contact = Contact::find($id);
        if ($contact == null) {
            return response()->json(
                ['message' => 'Tai du lieu thanh cong', 'success' => false, 'data' => null],
                404
            );
        }
        $contact->delete();
        return response()->json(['message' => 'thành công', 'success' => true, 'id' => $id], 200);
    }
}

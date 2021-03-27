<?php

namespace App\Http\Controllers;

use App\Models\BibleClass;
use App\Models\Member;
use App\Models\Setup;
use App\Models\ViewMembers;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class MemberController extends Controller
{
    public function index()
    {
        $members = ViewMembers::all();
        $bible_classes = BibleClass::orderBy('name')->get();
        $member_types = Setup::where('type', 'member_type')->orderBy('name')->get();

        return view('pages.member', [
            'page_uri' => 'members',
            'members' => $members,
            'bible_classes' => $bible_classes,
            'member_types' => $member_types
        ]);
    }

    public function show(int $id)
    {
        $member = Member::findOrFail($id);

        if ($member) {
            $response_code = Response::HTTP_OK;
            $response_message = "Date fetched successfully.";
            $response_data = $member;
        } else {
            $response_code = Response::HTTP_INTERNAL_SERVER_ERROR;
            $response_message = "Sorry! An error occured.";
            $response_data = [];
        }

        return response()->json([
            'code' => $response_code,
            'message' => $response_message,
            'data' => $response_data
        ], $response_code);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'contact_number' => 'required|string|max:10|min:10',
            'email' => 'nullable|email',
            'class_id' => 'required|integer',
            'member_type' => 'required|integer'
        ]);

        $member_data = $request->all();

        $result = DB::transaction(function () use ($member_data) {
            return Member::create($member_data);
        });

        if ($result) {
            $response_code = Response::HTTP_OK;
            $response_message = "Data saved successfully.";
        } else {
            $response_code = Response::HTTP_INTERNAL_SERVER_ERROR;
            $response_message = "Sorry! An error occured.";
        }

        return response()->json([
            'code' => $response_code,
            'message' => $response_message,
        ], $response_code);
    }

    public function update(Request $request, int $id)
    {
        $this->validate($request, [
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'contact_number' => 'required|string|max:10|min:10',
            'email' => 'nullable|email',
            'class_id' => 'required|integer',
            'member_type' => 'required|integer'
        ]);

        $member = Member::findOrFail($id);
        $member_data = $request->all();

        $result = DB::transaction(function () use ($member_data, $member) {
            return $member->update($member_data);
        });

        if ($result) {
            $response_code = Response::HTTP_OK;
            $response_message = "Data saved successfully.";
        } else {
            $response_code = Response::HTTP_INTERNAL_SERVER_ERROR;
            $response_message = "Sorry! An error occured.";
        }

        return response()->json([
            'code' => $response_code,
            'message' => $response_message,
        ], $response_code);
    }

    public function delete(Request $request)
    {
        $member = Member::findOrFail($request->id);

        $result = DB::transaction(function () use ($member) {
            return $member->delete();
        });

        if ($result) {
            $response_code = Response::HTTP_OK;
            $response_message = "Data deleted successfully.";
        } else {
            $response_code = Response::HTTP_INTERNAL_SERVER_ERROR;
            $response_message = "Sorry! An error occured.";
        }

        return response()->json([
            'code' => $response_code,
            'message' => $response_message,
        ], $response_code);
    }
}

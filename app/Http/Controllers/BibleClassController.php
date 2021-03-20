<?php

namespace App\Http\Controllers;

use App\Models\BibleClass;
use App\Models\Member;
use App\Models\ViewClasses;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class BibleClassController extends Controller
{
    public function index()
    {
        $members = Member::where('member_type', 1)->orderBy('first_name')->get();
        $bible_classes = ViewClasses::orderBy('id')->get();

        return view('pages.bible_class', [
            'page_uri' => 'bible_class',
            'members' => $members,
            'bible_classes' => $bible_classes,
        ]);
    }

    public function show(int $id)
    {
        $bible_class = BibleClass::findOrFail($id);
        $bible_class->class_members = $bible_class->members()->orderBy('first_name')->get();

        if ($bible_class) {
            $response_code = Response::HTTP_OK;
            $response_message = "Date fetched successfully.";
            $response_data = $bible_class;
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
            'name' => 'required|string|max:255|unique:tbl_classes',
            'leader' => 'nullable|integer',
            'assistant' => 'nullable|integer'
        ]);

        $class_data = $request->all();

        $result = DB::transaction(function () use ($class_data) {
            return BibleClass::create($class_data);
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
            'name' => ['required', 'string', 'max:255', Rule::unique("tbl_classes")->ignore($id)],
            'leader' => 'required|integer',
            'assistant' => 'required|integer'
        ]);

        $bible_class = BibleClass::findOrFail($id);
        $class_data = $request->all();

        $result = DB::transaction(function () use ($class_data, $bible_class) {
            return $bible_class->update($class_data);
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

    public function delete(int $id)
    {
        $bible_class = BibleClass::findOrFail($id);

        $result = DB::transaction(function () use ($bible_class) {
            return $bible_class->delete();
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

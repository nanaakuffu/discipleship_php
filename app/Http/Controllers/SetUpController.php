<?php

namespace App\Http\Controllers;

use App\Models\BibleClass;
use App\Models\Setup;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class SetUpController extends Controller
{
    public function index()
    {
        $setups = Setup::all();

        return view('pages.setup', [
            'page_uri' => 'setups',
            'setups' => $setups
        ]);
    }

    public function show(int $id)
    {
        $setup = Setup::findOrFail($id);

        if ($setup) {
            $response_code = Response::HTTP_OK;
            $response_message = "Date fetched successfully.";
            $response_data = $setup;
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
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:50'
        ]);

        $setups_data = $request->all();

        $result = DB::transaction(function () use ($setups_data) {
            return Setup::create($setups_data);
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
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:50'
        ]);

        $setup = Setup::findOrFail($id);
        $setups_data = $request->all();

        $result = DB::transaction(function () use ($setups_data, $setup) {
            return $setup->update($setups_data);
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
        $setup = Setup::findOrFail($id);

        $result = DB::transaction(function () use ($setup) {
            return $setup->delete();
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

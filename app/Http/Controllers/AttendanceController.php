<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\BibleClass;
use App\Models\Meeting;
use App\Models\Setup;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class AttendanceController extends Controller
{
    public function index()
    {
        $bible_classes = BibleClass::select(['id', 'name'])->get();
        $materials = Setup::where('type', 'material')->orderBy('name')->get();
        return view('pages.attendance', [
            'page_uri' => 'attendance',
            'bible_classes' => $bible_classes,
            'materials' => $materials
        ]);
    }

    public function attendanceExists(int $class_id, $meeting_date)
    {
        $given_date = date('Y-m-d H:i:s', strtotime(Carbon::parse($meeting_date)));

        $meeting = Meeting::where('class_id', '=', $class_id)->where('meeting_date', $given_date)->first();

        return (isset($meeting->id)) ? 1 : 0;
    }

    public function edit()
    {
        $bible_classes = BibleClass::select(['id', 'name'])->get();
        $materials = Setup::where('type', 'material')->orderBy('name')->get();
        return view('pages.edit_attendance', [
            'page_uri' => 'edit_attendance',
            'bible_classes' => $bible_classes,
            'materials' => $materials
        ]);
    }

    public function show(int $class_id, string $meeting_date)
    {
        $given_date = date('Y-m-d H:i:s', strtotime(Carbon::parse($meeting_date)));

        $meeting = Meeting::where([
            ['class_id', '=', $class_id],
            ['meeting_date', '=', $given_date]
        ])->first();

        if (isset($meeting->id)) {
            $members_present = Attendance::select('id', 'member_id')->where('meeting_id', $meeting->id)->pluck('member_id')->toArray();
            $class_details = BibleClass::findOrFail($meeting->class_id);
            $class_members = $class_details->members()->select(['id', 'first_name', 'middle_name', 'last_name'])->orderBy('first_name')->get();

            $meeting->class_members = $class_members;
            $meeting->class_details = $class_details;

            foreach ($meeting->class_members as $key) {
                $key->present = (in_array($key->id, $members_present)) ? 1 : 0;
            }

            $code = Response::HTTP_OK;
            $message = "Data fetched successfully.";
            $data = $meeting;
        } else {
            $code = Response::HTTP_NOT_FOUND;
            $message = "No data found for this query.";
            $data = [];
        }

        return response()->json(compact('code', 'message', 'data'));
    }

    public function store(Request $request)
    {
        $result = DB::transaction(function () use ($request) {
            $meeting = Meeting::create([
                'class_id' => $request->class_id,
                'material_id' => $request->material_id,
                'comments' => $request->comments,
                'meeting_date' => Carbon::parse($request->meeting_date)
            ]);

            if (isset($meeting->id)) {
                if (isset($request->members)) {
                    foreach ($request->members as $key => $value) {
                        Attendance::create([
                            'meeting_id' => $meeting->id,
                            'member_id' => $value
                        ]);
                    }
                }
                return 1;
            }
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
        $meeting = Meeting::findOrFail($id);

        $result = DB::transaction(function () use ($request, $meeting, $id) {
            $meeting_updated = $meeting->update([
                'class_id' => $request->class_id,
                'material_id' => $request->material_id,
                'comments' => $request->comments,
                'meeting_date' => Carbon::parse($request->meeting_date)
            ]);

            if ($meeting_updated) {
                // Get old attendance data
                $old_attendance_data = Attendance::select(['id', 'member_id'])->where('meeting_id', $id)->pluck('member_id', 'id')->toArray();
                $new_attendance_data = $request->members ?? [];

                $difference_array = $this->getArrayDifference($old_attendance_data, $new_attendance_data);

                // Delete the old data entered wrongly
                foreach ($difference_array['old'] as $key => $value) {
                    Attendance::where('id', $key)->delete();
                }

                // Add the new correct data
                if (count($difference_array['new']) > 0) {
                    foreach ($difference_array['new'] as $key => $value) {
                        Attendance::create([
                            'meeting_id' => $id,
                            'member_id' => $value
                        ]);
                    }
                }

                // Check to see if all the meeting data has been deleted
                // If you are deleting all attendance in a meeting then delete the meeting as well
                // At this point the new attendance array is empty
                $meeting_attendance = Attendance::where('meeting_id', $id)->get();
                if (count($meeting_attendance) == 0) {
                    $meeting->delete();
                }

                return 1;
            }
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
}

<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\BibleClass;
use App\Models\Meeting;
use App\Models\Member;
use App\Models\ViewAttendance;
use Illuminate\Http\Response;

class DashboardController extends Controller
{
    public function getStatistics()
    {
        $classes = BibleClass::count();
        $members = Member::whereIn('member_type', [2, 7])->count();
        $teachers = Member::where('member_type', 1)->count();
        $meetings = Meeting::count();

        return view('pages.dashboard')
            ->with('classes', $classes)
            ->with('members', $members)
            ->with('teachers', $teachers)
            ->with('meetings', $meetings)
            ->with('page_uri', 'dashboard');
    }

    public function getAttendance()
    {
        $attendance = ViewAttendance::all();
        $comments = implode(' ', Meeting::select('comments')->pluck('comments')->toArray());

        foreach ($attendance as $key) {
            $key->meeting_date = date('d-M-Y', strtotime($key->meeting_date));
        }

        $data = [
            'attendance' => $attendance,
            'comments' => $comments
        ];

        if ($attendance) {
            $response_code = Response::HTTP_OK;
            $response_message = "Data fetched successfully.";
            $response_data = $data;
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
}

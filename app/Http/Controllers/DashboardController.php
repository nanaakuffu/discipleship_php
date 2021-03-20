<?php

namespace App\Http\Controllers;

use App\Models\BibleClass;
use App\Models\Meeting;
use App\Models\Member;

class DashboardController extends Controller
{
    public function getStatistics()
    {
        $classes = BibleClass::count();
        $members = Member::whereIn('member_type', [2, 7])->count();
        $teachers = Member::where('member_type', 1)->count();
        $meetings = Meeting::count();

        return view('pages.dashboard')->with('classes', $classes)
            ->with('members', $members)
            ->with('teachers', $teachers)
            ->with('meetings', $meetings)
            ->with('page_uri', 'dashboard');
    }
}

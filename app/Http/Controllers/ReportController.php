<?php

namespace App\Http\Controllers;

use App\Models\BibleClass;
use App\Models\Setup;

class ReportController extends Controller
{
    public function index()
    {
        $classes = BibleClass::all();
        $report_types = Setup::where('type', 'report_type')->orderBy('name')->get();

        return view('pages.report', [
            'page_uri' => 'report',
            'report_types' => $report_types,
            'classes' => $classes
        ]);
    }
}

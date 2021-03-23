<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    protected $table = "tbl_reports";

    protected $fillable = [
        'report_type',
        'member_id',
        'report_comments'
    ];
}

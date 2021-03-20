<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Meeting extends Model
{
    protected $table = "tbl_meeting";

    protected $fillable = [
        'class_id',
        'meeting_date',
        'comments',
        'material_id'
    ];

    public function bibleClass()
    {
        return $this->belongsTo(BibleClass::class, 'class_id', 'id');
    }
}

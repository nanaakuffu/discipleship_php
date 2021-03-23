<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    protected $table = "tbl_members";

    protected $fillable = [
        'first_name',
        'middle_name',
        'last_name',
        'contact_number',
        'email',
        'class_id',
        'member_type'
    ];

    public function bibleClass()
    {
        return $this->belongsTo(BibleClass::class, 'class_id', 'id');
    }

    public function attendance()
    {
        return $this->hasMany(Attendance::class, 'member_id');
    }

    public function reports()
    {
        return $this->hasMany(Report::class, 'member_id');
    }

    public function getFullNameAttribute()
    {
        return $this->first_name . " " . $this->middle_name . " " . $this->last_name;
    }

    protected $appends = ['fullName'];
}

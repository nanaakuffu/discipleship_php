<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BibleClass extends Model
{
    protected $table = "tbl_classes";

    protected $fillable = [
        'name',
        'leader',
        'assistant'
    ];

    public function members()
    {
        return $this->hasMany(Member::class, 'class_id');
    }

    public function meetings()
    {
        return $this->hasMany(Meeting::class, 'class_id');
    }

    public function getLeaderNameAttribute()
    {
        return ($this->leader > 0)
            ? Member::where('id', $this->leader)->first()->fullName
            : "";
    }

    public function getAssistantNameAttribute()
    {
        return ($this->assistant > 0)
            ? Member::where('id', $this->assistant)->first()->fullName
            : "";
    }

    protected $appends = ['leaderName', 'assistantName'];
}

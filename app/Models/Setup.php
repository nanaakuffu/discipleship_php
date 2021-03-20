<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setup extends Model
{
    protected $table = "tbl_setups";

    protected $fillable = [
        'name',
        'type'
    ];
}

<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;


    private function compareArrays($a, $b)
    {
        if ($a === $b) {
            return 0;
        }
        return ($a > $b) ? 1 : -1;
    }

    public function getArrayDifference(array $old_data_array, array $new_data_array)
    {
        $old_data = array_diff($old_data_array, $new_data_array);
        $new_data = array_diff($new_data_array, $old_data_array);

        return [
            'old' => $old_data,
            'new' => $new_data
        ];
    }
}

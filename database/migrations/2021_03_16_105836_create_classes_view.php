<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateClassesView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW classes_view AS
        SELECT
            c.*,
            concat(m.first_name,' ', m.middle_name,' ', m.last_name) as leader_full_name,
            concat(x.first_name,' ', x.middle_name, ' ', x.last_name) as assistant_full_name
        FROM
            tbl_classes c
        INNER JOIN
            tbl_members m
        ON
            c.leader = m.id
        INNER JOIN
            tbl_members x
        ON
            c.assistant = x.id
        ORDER BY
            c.name;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('classes_view');
    }
}

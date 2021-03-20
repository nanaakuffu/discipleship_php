<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateMembersView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW members_view AS
        SELECT 
            m.*,
            concat(m.first_name,' ',m.middle_name,' ',m.last_name) as full_name,
            c.name as class_name,
            t.name as member_type_name
        FROM 
            tbl_members m
        INNER JOIN 
            tbl_classes c
        ON
            m.class_id = c.id
        INNER JOIN
            tbl_setups t
        ON
            m.member_type = t.id
        ORDER BY
            m.first_name;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('members_view');
    }
}

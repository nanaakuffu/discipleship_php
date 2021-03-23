<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateClassAttendanceView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW class_attendance_view AS
        select
            m.meeting_date,
            m.class_id,
            count(a.member_id) as attendance
        from 
            tbl_meeting m
        join tbl_attendance a on 
            m.id = a.meeting_id
        group by 
            m.meeting_date, m.class_id 
        order by 
            m.class_id;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('class_attendance_view');
    }
}

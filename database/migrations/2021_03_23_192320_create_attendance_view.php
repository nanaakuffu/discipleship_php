<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateAttendanceView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW attendance_view AS
        select
            m.meeting_date,
            count(a.member_id) as attendance
        from 
            tbl_meeting m
        join
            tbl_attendance a 
        on 
            m.id = a.meeting_id 
        group by 
            m.meeting_date
        order by 
            m.meeting_date;
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attendance_view');
    }
}

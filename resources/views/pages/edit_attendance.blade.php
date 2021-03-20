@extends('layout')
@section('content')

@push('layout-css')
<link rel="stylesheet" href="{{ asset('assets/plugins/summernote/summernote-bs4.min.css') }}">
<link rel="stylesheet" href="{{ asset('assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">
<link rel="stylesheet" href="{{ asset('assets/plugins/icheck/dataTables.checkboxes.css') }}">
<link rel="stylesheet" href="{{ asset('assets/plugins/icheck/blue.css') }}">
@endpush

<style>
    .content-row:hover {
        background-color: #ebebeb;
    }

    .content-row:hover {
        background-color: #ebebeb;
    }

    tr button.edit {
        display: none;
    }

    tr:hover button.edit {
        display: block;
        position: absolute;
        margin: auto;
        z-index: 555555555 !important;
    }

    textarea {
        resize: none;
    }

    /* tr:hover span.badge {
        opacity: 0;
        position: relative;
        z-index: 555;
    } */
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>{{ __('Edit Attendance') }}</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ URL::to('/')}}">Home</a></li>
                        <li class="breadcrumb-item active">Edit Attendance</li>
                    </ol>
                </div>
            </div><!-- /.container-fluid -->
    </section>

    <section class="content">

        <div class="container-fluid">

            <div class="card card-widget">

                <!-- card body -->
                <div class="card-body">

                    <div class="row mb-n3">
                        <input type="hidden" id="meeting_id" />
                        <div class="form-group col-md-4">
                            <select name="search_class_id" id="search_class_id" class="form-control" required>
                                <option value="0">-- Select Class --</option>
                                @foreach($bible_classes as $bible_class)
                                <option value="{{$bible_class->id}}">{{ $bible_class->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <div class="input-group date" id="search_meeting_date" data-target-input="nearest">
                                <input type="text" name="search_meeting_date" placeholder="Select meeting date" class="form-control datetimepicker-input search_meeting_date" data-target="#search_meeting_date" required />
                                <div class="input-group-append" data-target="#search_meeting_date" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-4">
                            <button class="btn btn-outline-danger form-control" id="searchAttendance" type="button">Search Attendance</button>
                        </div>
                    </div>
                    <hr />
                    <form id="addAttendance">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <select name="class_id" id="class_id" class="form-control">
                                            <option value="0">-- Select Class --</option>
                                            @foreach($bible_classes as $bible_class)
                                            <option value="{{$bible_class->id}}">{{ $bible_class->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="input-group date" id="meeting_date" data-target-input="nearest">
                                            <input type="text" name="meeting_date" placeholder="Select meeting date" class="form-control datetimepicker-input meeting_date" data-target="#meeting_date" required />
                                            <div class="input-group-append" data-target="#meeting_date" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <select name="material_id" id="material_id" class="form-control">
                                        <option value="0">-- Select Material --</option>
                                        @foreach($materials as $material)
                                        <option value="{{$material->id}}">{{ $material->name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="table responsive">
                                    <table id="attendanceTable" class="table table-hover display">
                                        <thead>
                                            <th>#</th>
                                            <th>Full Name</th>
                                            <th>Action</th>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <!-- <label>Class Leader</label> -->
                                    <span class="font-weight-light form-control" id="leader_name">
                                        Name
                                    </span>
                                </div>
                                <div class="form-group">
                                    <!-- <label>Class Assistant</label> -->
                                    <span class="font-weight-light form-control" id="assistant_name"></span>
                                </div>
                                <div class="form-group">
                                    <textarea name="comments" class="form-control" id="comments"></textarea>
                                </div>

                                <div class="float-right">
                                    <button class="btn btn-outline-primary" id="sendAttendanceData" type="submit">Save Attendance</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </section>

</div>

@push('layout-js')
<script src="{{ asset('assets/plugins/summernote/summernote-bs4.min.js') }}"></script>
<script src="{{ asset('assets/plugins/icheck/dataTables.checkboxes.min.js') }}"></script>
<script src="{{ asset('assets/plugins/icheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/plugins/moment/moment.min.js') }}"></script>
<script src="{{ asset('assets/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')}}"></script>
<script src="{{ asset('assets/js/attendance.js') }}"></script>
@endpush

@endsection
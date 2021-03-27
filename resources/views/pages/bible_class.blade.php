@extends('layout')
@section('content')
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
                    <h1>{{ __('Bible Classes') }}</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ URL::to('/')}}">Home</a></li>
                        <li class="breadcrumb-item active">Bible Classes</li>
                    </ol>
                </div>
            </div><!-- /.container-fluid -->
    </section>

    <section class="content">

        <div class="container-fluid">

            <div class="card card-widget">
                <div class="card-header">
                    <div class="user-block">
                        <div class="float-right">
                            <button class="btn btn-info" data-toggle="modal" data-target="#class-modal"><i class="fa fa-plus"></i> Add Bible Class</button>
                        </div>
                    </div>
                </div>

                <!-- card body -->
                <div class="card-body">
                    @csrf
                    <div class="table responsive">
                        <table id="bibleClassTable" class="table table-hover">
                            <thead>
                                <th>Class Name</th>
                                <th>Teacher</th>
                                <th>Assistant</th>
                                <th>Date Modified</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @if (count($bible_classes) > 0 )
                                @foreach($bible_classes ?? '' as $bible_class)
                                <tr>
                                    <td>{{ $bible_class->name }}</td>
                                    <td>{{ $bible_class->leader_full_name }}</td>
                                    <td>{{ $bible_class->assistant_full_name }}</td>
                                    <td>{{ $bible_class->updated_at->format('j M, Y') }}</td>
                                    <td>
                                        <button onclick="showClass('{{ $bible_class->id }}')" class="btn btn-sm btn-primary rounded-circle edit mx-1 mt-n1"><i class="far fa-edit"></i></button>
                                        <button onclick="deleteClass('{{ $bible_class->id }}')" class="btn btn-sm btn-danger rounded-circle edit mx-5 mt-n1"><i class="far fa-trash-alt"></i></button>
                                    </td>
                                </tr>
                                @endforeach
                                @else
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--end row of content-->
            </div>
        </div>

    </section>

</div>

<div class="modal fade" id="class-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #4ba1e2;">
            <div class="modal-header">
                <h4 class="modal-title">Bible Class</h4>
            </div>
            <div class="modal-body">
                <form id="addClass">
                    @csrf

                    <input type="hidden" name="id" id="class_id" value="">
                    <div class="form-group">
                        <label for="name">Class Name</label>
                        <input class="form-control" name="name" id="name" placeholder="eg: Group 1" type="text" :value="old('name')" required autofocus autocomplete="name">
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="type">Teacher</label>
                            <select name="leader" id="leader" class="form-control">
                                <option value="0">-- Leader --</option>
                                @foreach($members as $member)
                                <option value="{{$member->id}}">{{ $member->fullName }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="type">Assistant</label>
                            <select name="assistant" id="assistant" class="form-control">
                                <option value="0">-- Assistant --</option>
                                @foreach($members as $member)
                                <option value="{{$member->id}}">{{ $member->fullName }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline-light" form="addClass"> <i class="fa fa-plus-circle"></i> Save</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

@push('layout-js')
<script src="{{ asset('assets/js/functions.js') }}"></script>
<script src="{{ asset('assets/js/bibleClass.js') }}"></script>
@endpush

@endsection
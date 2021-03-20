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
                    <h1>{{ __('Members') }}</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{ URL::to('/')}}">Home</a></li>
                        <li class="breadcrumb-item active">Members</li>
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
                            <button class="btn btn-info" data-toggle="modal" data-target="#member-modal"><i class="fa fa-plus"></i> Add Members</button>
                        </div>
                    </div>
                </div>

                <!-- card body -->
                <div class="card-body">
                    @csrf
                    <div class="table responsive">
                        <table id="membersTable" class="table table-hover">
                            <thead>
                                <th>Full Name</th>
                                <th>Contact Number</th>
                                <th>Class</th>
                                <th>Member Type</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @if (count($members) > 0 )
                                @foreach($members ?? '' as $member)
                                <tr>
                                    <td>{{ $member->full_name }}</td>
                                    <td>{{ $member->contact_number }}</td>
                                    <td>{{ $member->class_name }}</td>
                                    <td>{{ $member->member_type_name }}</td>
                                    <td>
                                        <button onclick="showMember('{{ $member->id }}')" class="btn btn-sm btn-primary rounded-circle edit mx-1 mt-n1"><i class="far fa-edit"></i></button>
                                        <button onclick="deleteMember('{{ $member->id }}')" class="btn btn-sm btn-danger rounded-circle edit mx-5 mt-n1"><i class="far fa-trash-alt"></i></button>
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

<div class="modal fade" id="member-modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #4ba1e2;">
            <div class="modal-header">
                <h4 class="modal-title">Membership</h4>
            </div>
            <div class="modal-body">
                <form id="addMember">
                    @csrf

                    <input type="hidden" name="id" id="member_id">
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="name">First Name</label>
                            <input class="form-control" name="first_name" id="first_name" placeholder="eg: John" type="text" :value="old('first_name')" required autofocus autocomplete="name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Middle Name</label>
                            <input class="form-control" name="middle_name" id="middle_name" placeholder="eg: Dove" type="text" :value="old('middle_name')" required autofocus autocomplete="name">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="name">Last Name</label>
                            <input class="form-control" name="last_name" id="last_name" placeholder="eg: Doe" type="text" :value="old('name')" required autofocus autocomplete="name">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Contact Number</label>
                            <input class="form-control" name="contact_number" id="contact_number" placeholder="eg: 0244 112233" type="text" :value="old('name')" required autofocus autocomplete="name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">Email</label>
                        <input class="form-control" name="email" id="email" placeholder="eg: example@domain.com" type="text" :value="old('name')" required autofocus autocomplete="name">
                    </div>

                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="type">Bible Class</label>
                            <select name="class_id" id="class_id" class="form-control">
                                <option>-- Select Class --</option>
                                @foreach($bible_classes as $bible_class)
                                <option value="{{$bible_class->id}}">{{ $bible_class->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="type">Member Type</label>
                            <select name="member_type" id="member_type" class="form-control">
                                <option>-- Select Member Type --</option>
                                @foreach($member_types as $member_type)
                                <option value="{{$member_type->id}}">{{ $member_type->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                </form>
            </div>

            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline-light" form="addMember"> <i class="fa fa-plus-circle"></i> Save</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

@push('layout-js')
<script src="{{ asset('assets/js/members.js') }}"></script>
@endpush

@endsection
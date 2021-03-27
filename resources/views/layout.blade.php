<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset=" utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Discipleship Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('assets/plugins/fontawesome-free/css/all.min.css')}}">
    <!-- Ionicons -->

    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">

    <!-- pace-progress -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/pace-progress/themes/black/pace-theme-flat-top.css')}}">

    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{asset('assets/dist/css/adminlte.min.css')}}">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@100;200;300;400;600;700&display=swap" rel="stylesheet">

    @stack('layout-css')

    <!-- Toastr -->
    <link rel="stylesheet" href="{{asset('assets')}}/plugins/toastr/toastr.min.css">

</head>
<style>
    body {
        font-family: 'Nunito', 'Segoe UI', sans-serif;
    }

    label.error {
        color: #F0E68C;
        font-size: 0.9rem;
        font-weight: 100;
        display: block;
        margin-top: 5px;
    }

    input.error {
        border: 1px dashed red;
        font-weight: 300;
        color: red;
    }
</style>
<!-- <body class="hold-transition sidebar-mini"> -->

<body class="sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed hold-transition pace-primary" style="height: auto;">

    <!-- Site wrapper -->
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="{{ url('/profile') }}" class="nav-link">Profile</a>
                </li>
            </ul>

            <!-- SEARCH FORM -->

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-itemn">
                    <a href="#" class="nav-link" data-target="#register-modal" data-toggle="modal" data-tooltip="tooltip" title="Add New User">
                        <!-- <i class="fas fa-user-plus"></i> -->
                        <i class="fas fa-user-plus" style="font-size:18px"></i>
                    </a>
                </li>

                <!-- Messages Dropdown Menu -->
                <li class="nav-itemn">

                    <a class="nav-link" id="logout" href="/logout-user" data-tooltip="tooltip" title="Log Out">
                        <i class="fas fa-sign-out-alt" style="font-size:18px"></i>
                    </a>

                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->

            <div class="login-logo mt-4">
                <img src="{{ asset('assets/img/gccamp_logo.jpeg') }}" width="60px" class="brand-image img-circle elevation-3" alt="PainMap" alt="User Image">
            </div>

            <!-- Sidebar -->
            <div class="sidebar mt-n2">
                <!-- Sidebar user (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img class="brand-image img-circle elevation-2" src="https://ui-avatars.com/api/?name=GC Camp&color=7F9CF5&background=EBF4FF&size=128" alt="{{-- auth()->user()->first_name --}}">
                    </div>
                    <div class="info">
                        <a href="{{ url('/profile') }}" class="d-block">{{ __('GC Camp')}}</a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon classwith font-awesome or any other icon font library -->

                        <li class="nav-item">
                            <a href="/" class="nav-link {{ $page_uri == 'dashboard' ? 'active': '' }}">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{ url('/members') }}" class="nav-link {{ $page_uri == 'members' ? 'active': '' }} ">
                                <i class="fas fa-user-friends nav-icon"></i>
                                <p>Membership</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{url('/bible-class' )}}" class="nav-link {{ $page_uri == 'bible_class' ? 'active': '' }}">
                                <i class="fas fa-users nav-icon"></i>
                                <p>Classes</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{url('/attendance')}}" class="nav-link {{ $page_uri == 'attendance' ? 'active': '' }}">
                                <i class="fas fa-user-check nav-icon"></i>
                                <p>Mark Attendance</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{url('/edit-attendance')}}" class="nav-link {{ $page_uri == 'edit_attendance' ? 'active': '' }}">
                                <i class="fas fa-user-check nav-icon"></i>
                                <p>Edit Attendance</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{url('/reports')}}" class="nav-link {{-- $page_uri == 'therapist_resources' ? 'active': '' --}}">
                                <i class="fas fa-chart-pie nav-icon"></i>
                                <p>Reports</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{ url('/setups') }}" class="nav-link {{ $page_uri == 'setups' ? 'active': '' }}">
                                <i class="nav-icon fas fa-tools"></i>
                                <p>Setups</p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Main content -->
        @yield("content")

        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <strong>Copyright</strong> &copy; 2020 - {{ date('Y') }} <a href="https://giftingsandcallings.org/" class="font-family-light"><strong>Gifting and Callings Camp</strong></a>. All rights
            reserved.
        </footer>

        <!-- /.content -->
    </div>
    <!-- ./wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->

    <!-- Sign Up Modal -->
    <div aria-hidden="true" class="modal fade" role="dialog" id="register-modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content" style="background-color: #4ba1e2;">
                <div class="modal-header">
                    <h4 class="modal-title">Add New User</h4>
                </div>
                <!-- Close Start -->
                <div class="modal-body">
                    <form id="internalSignUp">
                        @csrf
                        <div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label class="text-white" for="firstName">First Name</label>
                                    <input class="form-control" name="first_name" id="firstName" placeholder="eg: James" type="text" :value="old('first_name')" autofocus autocomplete="first_name">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <!--/.form-group-->
                                <div class="form-group">
                                    <label class="text-white" for="lastName">Last Name</label>
                                    <input class="form-control" name="last_name" id="lastName" placeholder="eg. Smith" type="text" autocomplete="last_name">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label class="text-white" for="contactNumber">Contact Number</label>
                                    <input class="form-control" name="contact_number" id="contactNumber" placeholder="eg: +44 7911 123456" type="text" autocomplete="contact_number">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label class="text-white" for="emailAddress">Email Address</label>
                                    <input class="form-control" name="email" id="emailAddress" placeholder="eg: jamessmith@domain.com" type="text" autocomplete="email">
                                </div>
                            </div>
                        </div>

                        <!--/.form-group-->
                        <div class="row">
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label class="text-white" for="userpassword">Password</label>
                                    <input class="form-control" name="userpassword" id="userpassword" placeholder="Type your password" type="password" autocomplete="new-password">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div class="form-group">
                                    <label class="text-white" for="passwordconfirmation">Confirm Password</label>
                                    <input class="form-control" name="passwordconfirmation" id="passwordconfirmation" placeholder="Confirm password" type="password" autocomplete="new-password">
                                </div>
                            </div>
                        </div>

                    </form>
                </div><!-- Register Section End -->
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-light" form="internalSignUp"><i class="fa fa-plus-circle"></i> Add User</button>
                </div>
            </div>
            <!-- Forgot Password Section Start -->
            <!--/.modal-content-->
        </div>
        <!--/.modal-dialog-->
    </div><!-- Login Modal End -->

    <!-- jQuery -->
    <script src="{{asset('assets/plugins/jquery/jquery.min.js')}}"></script>
    <!-- Bootstrap 4 -->
    <script src="{{asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

    <!-- DataTables -->
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/jquery-validation/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>

    <!-- pace-progress -->
    <script src="{{ asset('assets/plugins/pace-progress/pace.min.js')}}"></script>

    <!-- ChartJS -->
    <script src="{{ asset('assets/plugins/chart.js/Chart.min.js') }}"></script>

    <!-- AdminLTE App -->
    <script src="{{asset('assets/dist/js/adminlte.min.js')}}"></script>

    <!-- Toastr -->
    <script src="{{asset('assets')}}/plugins/toastr/toastr.min.js"></script>

    @stack('layout-js')

    <script>
        $(document).ready(function() {
            $('[data-tooltip="tooltip"]').tooltip();

            $.validator.addMethod('greaterThan', (value, el, param) => {
                return value > param;
            }, "Please make a selection.");
        });
    </script>

</body>

</html>
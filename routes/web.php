<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Dashboard routes
Route::get('/', [App\Http\Controllers\DashboardController::class, 'getStatistics']);
Route::get('/attendance-data', [App\Http\Controllers\DashboardController::class, 'getAttendance']);

// Setup routes
Route::get('/setups', [App\Http\Controllers\SetUpController::class, 'index']);
Route::get('/setups/{id}', [App\Http\Controllers\SetUpController::class, 'show']);
Route::post('/setups', [App\Http\Controllers\SetUpController::class, 'store']);
Route::post('/setups/{id}', [App\Http\Controllers\SetUpController::class, 'update']);
Route::post('/delete-setup', [App\Http\Controllers\SetUpController::class, 'delete']);

// Members routes
Route::get('/members', [App\Http\Controllers\MemberController::class, 'index']);
Route::get('/members/{id}', [App\Http\Controllers\MemberController::class, 'show']);
Route::post('/members', [App\Http\Controllers\MemberController::class, 'store']);
Route::post('/members/{id}', [App\Http\Controllers\MemberController::class, 'update']);
Route::post('/delete-member', [App\Http\Controllers\MemberController::class, 'delete']);

// Bible Class routes
Route::get('/bible-class', [App\Http\Controllers\BibleClassController::class, 'index']);
Route::get('/bible-class/{id}', [App\Http\Controllers\BibleClassController::class, 'show']);
Route::post('/bible-class', [App\Http\Controllers\BibleClassController::class, 'store']);
Route::post('/bible-class/{id}', [App\Http\Controllers\BibleClassController::class, 'update']);
Route::post('/delete-bible-class', [App\Http\Controllers\BibleClassController::class, 'delete']);

// Attendance routes
Route::get('/attendance', [App\Http\Controllers\AttendanceController::class, 'index']);
Route::get('/edit-attendance', [App\Http\Controllers\AttendanceController::class, 'edit']);
Route::get('/get-attendance/{class_id}/{meeting_date}', [App\Http\Controllers\AttendanceController::class, 'attendanceExists']);
Route::get('/attendance/{class_id}/{meeting_date}', [App\Http\Controllers\AttendanceController::class, 'show']);
Route::post('/attendance', [App\Http\Controllers\AttendanceController::class, 'store']);
Route::post('/attendance/{id}', [App\Http\Controllers\AttendanceController::class, 'update']);

// 

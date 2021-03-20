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

Route::get('/', [App\Http\Controllers\DashboardController::class, 'getStatistics']);

// Setup routes
Route::get('/setups', [App\Http\Controllers\SetUpController::class, 'index']);
Route::get('/setups/{id}', [App\Http\Controllers\SetUpController::class, 'show']);
Route::post('/setups', [App\Http\Controllers\SetUpController::class, 'store']);
ROute::post('/setups/{id}', [App\Http\Controllers\SetUpController::class, 'update']);

// 
Route::get('/members', [App\Http\Controllers\MemberController::class, 'index']);
Route::get('/members/{id}', [App\Http\Controllers\MemberController::class, 'show']);
Route::post('/members', [App\Http\Controllers\MemberController::class, 'store']);
ROute::post('/members/{id}', [App\Http\Controllers\MemberController::class, 'update']);

// 
Route::get('/bible-class', [App\Http\Controllers\BibleClassController::class, 'index']);
Route::get('/bible-class/{id}', [App\Http\Controllers\BibleClassController::class, 'show']);
Route::post('/bible-class', [App\Http\Controllers\BibleClassController::class, 'store']);
ROute::post('/bible-class/{id}', [App\Http\Controllers\BibleClassController::class, 'update']);

// 
Route::get('/attendance', [App\Http\Controllers\AttendanceController::class, 'index']);
Route::get('/edit-attendance', [App\Http\Controllers\AttendanceController::class, 'edit']);
Route::get('/get-attendance/{class_id}/{meeting_date}', [App\Http\Controllers\AttendanceController::class, 'attendanceExists']);
Route::get('/attendance/{class_id}/{meeting_date}', [App\Http\Controllers\AttendanceController::class, 'show']);
Route::post('/attendance', [App\Http\Controllers\AttendanceController::class, 'store']);
ROute::post('/attendance/{id}', [App\Http\Controllers\AttendanceController::class, 'update']);

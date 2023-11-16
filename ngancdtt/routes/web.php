<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ConfigController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::prefix('admin')->middleware('adminlogin')->group(function () {
    Route::get('admin/login', [AuthController::class, 'login'])->name('admin.login');
    Route::get('admin/postlogin', [AuthController::class, 'postlogin'])->name('admin.postlogin');
    Route::get('admin/logout', [AuthController::class, 'logout'])->name('admin.logout');
});

Route::prefix('config')->group(function () {
    Route::get('/', [ConfigController::class, 'index'])->name('config.index');
    Route::get('createorupdate', [ConfigController::class, 'createorupdate'])->name('config.createorupdate');
});

<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\OrderdetailController;
use App\Http\Controllers\Api\PolicyController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductsaleController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\TopicController;
use App\Http\Controllers\Api\UserController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Brand
Route::prefix('brand')->group(function () {
    Route::get('index', [BrandController::class, 'index']);
    Route::get('show/{id}', [BrandController::class, 'show']);
    Route::post('store', [BrandController::class, 'store']);
    Route::post('update/{id}', [BrandController::class, 'update']);
    Route::delete('destroy/{id}', [BrandController::class, 'destroy']);

    Route::post('restore/{id}', [BrandController::class, 'restore']);
    Route::post('sortdelete/{id}', [BrandController::class, 'sortdelete']);
    Route::get('trash', [BrandController::class, 'trash']);
});

// Category
Route::prefix('category')->group(function () {
    Route::get('index', [CategoryController::class, 'index']);
    Route::get('show/{id}', [CategoryController::class, 'show']);
    Route::post('store', [CategoryController::class, 'store']);
    Route::post('update/{id}', [CategoryController::class, 'update']);
    Route::delete('destroy/{id}', [CategoryController::class, 'destroy']);

    Route::post('restore/{id}', [CategoryController::class, 'restore']);
    Route::post('sortdelete/{id}', [CategoryController::class, 'sortdelete']);
    Route::get('trash', [CategoryController::class, 'trash']);
});
Route::get('category_list/{parent_id?}', [CategoryController::class, 'category_list']);

// Contact
Route::prefix('contact')->group(function () {
    Route::get('index', [ContactController::class, 'index']);
    Route::get('show/{id}', [ContactController::class, 'show']);
    Route::post('store', [ContactController::class, 'store']);
    Route::post('update/{id}', [ContactController::class, 'update']);
    Route::delete('destroy/{id}', [ContactController::class, 'destroy']);

    Route::post('restore/{id}', [ContactController::class, 'restore']);
    Route::post('sortdelete/{id}', [ContactController::class, 'sortdelete']);
    Route::get('trash', [ContactController::class, 'trash']);
});

// Menu
Route::prefix('menu')->group(function () {
    Route::get('index', [MenuController::class, 'index']);
    Route::get('show/{id}', [MenuController::class, 'show']);
    Route::post('store', [MenuController::class, 'store']);
    Route::post('update/{id}', [MenuController::class, 'update']);
    Route::delete('destroy/{id}', [MenuController::class, 'destroy']);

    Route::post('restore/{id}', [MenuController::class, 'restore']);
    Route::post('sortdelete/{id}', [MenuController::class, 'sortdelete']);
    Route::get('trash', [MenuController::class, 'trash']);
});
Route::get('menu_list/{position}/{parent_id?}', [MenuController::class, 'menu_list']);

// Order
Route::prefix('order')->group(function () {
    Route::get('index', [OrderController::class, 'index']);
    Route::get('show/{id}', [OrderController::class, 'show']);
    Route::post('store', [OrderController::class, 'store']);
    Route::post('update/{id}', [OrderController::class, 'update']);
    Route::delete('destroy/{id}', [OrderController::class, 'destroy']);

    Route::post('restore/{id}', [OrderController::class, 'restore']);
    Route::post('sortdelete/{id}', [OrderController::class, 'sortdelete']);
    Route::get('trash', [OrderController::class, 'trash']);
});

// OrderDetail
Route::prefix('orderdetail')->group(function () {
    Route::get('index', [OrderdetailController::class, 'index']);
    Route::get('show/{id}', [OrderdetailController::class, 'show']);
    Route::post('store', [OrderdetailController::class, 'store']);
    Route::post('update/{id}', [OrderdetailController::class, 'update']);
    Route::delete('destroy/{id}', [OrderdetailController::class, 'destroy']);

    Route::post('restore/{id}', [OrderdetailController::class, 'restore']);
    Route::post('sortdelete/{id}', [OrderdetailController::class, 'sortdelete']);
    Route::get('trash', [OrderdetailController::class, 'trash']);
});

// Policy
Route::prefix('policy')->group(function () {
    Route::get('index', [PolicyController::class, 'index']);
    Route::get('show/{id}', [PolicyController::class, 'show']);
    Route::post('store', [PolicyController::class, 'store']);
    Route::post('update/{id}', [PolicyController::class, 'update']);
    Route::delete('destroy/{id}', [PolicyController::class, 'destroy']);

    Route::post('restore/{id}', [PolicyController::class, 'restore']);
    Route::post('sortdelete/{id}', [PolicyController::class, 'sortdelete']);
    Route::get('trash', [PolicyController::class, 'trash']);
});

// Post
Route::prefix('post')->group(function () {
    Route::get('index', [PostController::class, 'index']);
    Route::get('show/{id}', [PostController::class, 'show']);
    Route::post('store', [PostController::class, 'store']);
    Route::post('update/{id}', [PostController::class, 'update']);
    Route::delete('destroy/{id}', [PostController::class, 'destroy']);

    Route::post('restore/{id}', [PostController::class, 'restore']);
    Route::post('sortdelete/{id}', [PostController::class, 'sortdelete']);
    Route::get('trash', [PostController::class, 'trash']);
});
Route::get('post_list/{type}/{limit}', [PostController::class, 'post_list']);
Route::get('post_all/{limit}/{page?}', [PostController::class, 'post_all']);
Route::get('post_topic/{topic_id}/{limit}/{page?}', [PostController::class, 'post_topic']);
Route::get('post_detail/{id}', [PostController::class, 'post_detail']);
Route::get('post_other/{id}/{limit}', [PostController::class, 'post_other']);

// Product
Route::prefix('product')->group(function () {
    Route::get('index', [ProductController::class, 'index']);
    Route::get('show/{id}', [ProductController::class, 'show']);
    Route::post('store', [ProductController::class, 'store']);
    Route::post('update/{id}', [ProductController::class, 'update']);
    Route::delete('destroy/{id}', [ProductController::class, 'destroy']);

    Route::post('restore/{id}', [ProductController::class, 'restore']);
    Route::post('sortdelete/{id}', [ProductController::class, 'sortdelete']);
    Route::get('trash', [ProductController::class, 'trash']);
});
Route::get('product_home/{limit}/{category_id?}', [ProductController::class, 'product_home']);
Route::get('product_all/{limit}/{page?}', [ProductController::class, 'product_all']);
Route::get('product_category/{category_id}/{limit}/{page?}', [ProductController::class, 'product_category']);
Route::get('product_brand/{brand_id}/{limit}', [ProductController::class, 'product_brand']);
Route::get('product_other/{id}/{limit}', [ProductController::class, 'product_other']);
Route::get('product_detail/{slug}', [ProductController::class, 'product_detail']);
Route::get('search/{key}', [ProductController::class, 'search']);

// Productsale
Route::prefix('productsale')->group(function () {
    Route::get('index', [ProductsaleController::class, 'index']);
    Route::get('show/{id}', [ProductsaleController::class, 'show']);
    Route::post('store', [ProductsaleController::class, 'store']);
    Route::post('update/{id}', [ProductsaleController::class, 'update']);
    Route::delete('destroy/{id}', [ProductsaleController::class, 'destroy']);

    Route::post('restore/{id}', [ProductsaleController::class, 'restore']);
    Route::post('sortdelete/{id}', [ProductsaleController::class, 'sortdelete']);
    Route::get('trash', [ProductsaleController::class, 'trash']);
});

// Slider
Route::prefix('slider')->group(function () {
    Route::get('index', [SliderController::class, 'index']);
    Route::get('show/{id}', [SliderController::class, 'show']);
    Route::post('store', [SliderController::class, 'store']);
    Route::post('update/{id}', [SliderController::class, 'update']);
    Route::delete('destroy/{id}', [SliderController::class, 'destroy']);

    Route::post('restore/{id}', [SliderController::class, 'restore']);
    Route::post('sortdelete/{id}', [SliderController::class, 'sortdelete']);
    Route::get('trash', [SliderController::class, 'trash']);
});
Route::get('slider_list/{position}', [SliderController::class, 'slider_list']);

// Topic
Route::prefix('topic')->group(function () {
    Route::get('index', [TopicController::class, 'index']);
    Route::get('show/{id}', [TopicController::class, 'show']);
    Route::post('store', [TopicController::class, 'store']);
    Route::post('update/{id}', [TopicController::class, 'update']);
    Route::delete('destroy/{id}', [TopicController::class, 'destroy']);

    Route::post('restore/{id}', [TopicController::class, 'restore']);
    Route::post('sortdelete/{id}', [TopicController::class, 'sortdelete']);
    Route::get('trash', [TopicController::class, 'trash']);
});
Route::get('topic_list/{parent_id?}', [TopicController::class, 'topic_list']);

// User
Route::prefix('user')->group(function () {
    Route::get('index', [UserController::class, 'index']);
    Route::get('show/{id}', [UserController::class, 'show']);
    Route::post('store', [UserController::class, 'store']);
    Route::post('update/{id}', [UserController::class, 'update']);
    Route::delete('destroy/{id}', [UserController::class, 'destroy']);

    Route::post('restore/{id}', [UserController::class, 'restore']);
    Route::post('sortdelete/{id}', [UserController::class, 'sortdelete']);
    Route::get('trash', [UserController::class, 'trash']);
});

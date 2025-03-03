<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ProductController;

Route::apiResource('categories',CategoryController::class);
Route::apiResource('suppliers',SupplierController::class);
Route::apiResource('customers',CustomerController::class);
Route::resource('products', ProductController::class);
// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

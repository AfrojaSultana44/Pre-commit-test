<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    $arr = [1, 2, 3];
    echo $arr;

    return view('about');
});

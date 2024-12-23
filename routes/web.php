<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    $arr = [1, 2, 3];
    echo $arr;
    $sum = $a + $b;
    echo $sum;

    return view('about');
});

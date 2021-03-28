<?php

use Diglactic\Breadcrumbs\Breadcrumbs;

Breadcrumbs::for('home', function ($trail) {
    $trail->push('Home', route('home'));
});

Breadcrumbs::for('login', function ($trail) {
    $trail->parent('home');
    $trail->push('Login', route('login'));
});

Breadcrumbs::for('for', function ($trail) {
    $trail->parent('home');
    $trail->push('for', route('for'));
});

Breadcrumbs::for('password.request', function ($trail) {
    $trail->parent('login');
    $trail->push('Reset Password', route('password.request'));
});

Breadcrumbs::for('password.reset', function ($trail) {
    $trail->parent('password.request');
    $trail->push('Change', route('password.reset'));
});

Breadcrumbs::for('cabinet', function ($trail) {
    $trail->parent('home');
    $trail->push('Cabinet', route('cabinet'));
});

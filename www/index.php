<?php

use Phalcon\Mvc\Micro;

$app = new Micro();

$app->get('/', function () use ($app) {
    echo "Hello World!";
});

$app->handle();
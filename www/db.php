<?php

use Phalcon\Db\Adapter\Pdo\Postgresql as PostgresAdapter;
use Phalcon\Mvc\Micro;

$app = new Micro();

$app["db"] = function () {
	return new PostgresAdapter(
		[
			"host" => "db",
			"username" => "docker",
			"password" => "docker",
			"dbname" => "docker",
		]
	);
};

$app->get('/', function () use ($app) {
	$sales = $app["db"]->query("SELECT
	  dates.day,
	  (SELECT SUM(amount) FROM sales WHERE sold_on=dates.day) AS amount
	FROM
	  (SELECT '2016-01-01'::DATE + GENERATE_SERIES(0, 30) AS day) AS dates
	;");
	echo json_encode(["result" => $sales->fetchAll(\Phalcon\Db::FETCH_ASSOC)]);
});

$app->handle();
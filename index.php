<?php

#  phpinfo();

require __DIR__ . '/vendor/autoload.php';

/*
$log = new Monolog\Logger('name');
$log->pushHandler(new Monolog\Handler\StreamHandler('app.log', Monolog\Logger::WARNING));
$log->addWarning('Foo');
*/

print_r(get_declared_classes());


#$t = new Database\Test();


$h = new Hello\HelloWorld();

print_r($h->content());

$connectionInfo = [
			'db'     => 'UIExtension',
			'server' => 'd-db-w.itcs.uiuc.edu',
			'dbUser' => 'ExtensionWebUser',
			'dbPass' => 'Ca?R&st9sp#6',
		];

#Database\ConnectionFactory::build($connectionInfo);    
    

print "Hi";

?>
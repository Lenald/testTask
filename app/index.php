<?php

require_once 'dao/DAOConnection.php';
require_once 'dao/DAOException.php';
require_once 'dao/EmployeeDAO.php';
require_once 'dao/TimeReportDAO.php';
require_once 'domain/Application.php';
require_once 'domain/DomainException.php';
require_once 'domain/TimeReport.php';
require_once 'vendor/autoload.php';

try {
    $log = new Katzgrau\KLogger\Logger(__DIR__.'/../logs');
    $app = new Domain\Application();
    $app->run();
} catch (RuntimeException | Domain\DomainException $e){
    echo "Internal application error";
    if ($e instanceof RuntimeException) {
        //notice developers that the app can't create a log object
    } elseif ($e instanceof Domain\DomainException) {
        //notice ...
        $log->emergency('Failed to create an Application object', 0, $e->toArray());
    } else {
        $log->warning('Unknown exception', 0, [$e->__toString()]);
    }
}
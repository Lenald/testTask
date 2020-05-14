<?php
namespace Domain;

class Application {

    public static function run()
    {
        try {
            $timeReport = new TimeReport();
            $timeReport->getReport();
        } catch (DomainException $e) {
            global $log;
            $log->error('DomainException in Application::run(): Failed to get report', $e->toArray());
            echo $e->getMessage()."\n";
        }
    }

}

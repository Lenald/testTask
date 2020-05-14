<?php
namespace DAO;

class TimeReportDAO extends DAOConnection
{

    public function getReport()
    {
        $connection = null;

        //NOTICE: У меня таблица заполнена с 4 по 13 мая 2020
        $datePointer = new \DateTime('2020-05-04');
        $dateEnd = new \DateTime('2020-05-10');
        
        //Боевой вариант:
        //$dateEnd = new \DateTime();
        //$datePointer = clone $dateEnd;
        //$datePointer->modify('-1 week');

        $query = "SELECT `time_reports`.`hours`, `employees`.`name`
                  FROM `time_reports`
                  RIGHT JOIN `employees` ON `time_reports`.`employee_id`=`employees`.`id`
                  WHERE `date`=?
                  ORDER BY `hours` DESC
                  LIMIT 3";

        $arr = [];

        try {
            $connection = $this->connect();
            $res = $connection->prepare($query);

            for (; $datePointer <= $dateEnd; $datePointer->modify('+1 day')) {
                $date = $datePointer->format('n/j/Y');
                $res->execute(array($date));

                while ($row = $res->fetch()) {
                    $arr[$date][] = $row['name'].' ('.number_format($row['hours'], 2).' hours)';
                }

                if (!array_key_exists($date, $arr)) {
                    $arr[$date][] = 'No data';
                }

            }

        } catch (DAOException | \Error $e) {
            global $log;
            $arr = ($e instanceof \Error) ? [$e->__toString()] : $e->toArray();
            $log->error('DAOException (or Error) in TimeReportDAO::getReport(): Failed to get report', $arr);
            throw new DAOException('Failed to get report', 0, $e);
        } finally {
            $connection = null;
        }

        return $arr;
    }

}

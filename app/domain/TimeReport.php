<?php
namespace Domain;

use DAO\EmployeeDAO;
use DAO\TimeReportDAO;
use DAO\DAOException;

class TimeReport
{

    public function getReport()
    {
        try {
            $dao = new EmployeeDAO();
            $count = $dao->getCount();
            if ($count < 1) {
                global $log;
                $log->error('TimeReprot::getReport(): Failed to get a report because there are no employees');
                throw new DomainException ('Failed to get a report because there are no employees');
            }

            $dao = new TimeReportDAO();
            $data = $dao->getReport();

            $day = null;

            foreach ($data as $date => $top3) {
                $day = \DateTime::createFromFormat('n/j/Y', $date);
                $top = '';
                
                foreach ($top3 as $employeeInfo) {
                    if (!empty($top)) {
                        $top .= ', ';
                    }
                    $top .= $employeeInfo;
                }
                
                //На вскидку, сделаем длину строки 80 символов:
                //Самый длинный день - Wednesday (9)
                //+3 символа на границы
                //И 68 на всё остальное
                printf("|%-9s|%-68s|\n", $day->format('l'), $top);
                
                //Вариант "меньше кода и очевиднее":
                /*
                foreach ($data as $date => $top3) {
                   $day = DateTime::createFromFormat('n/j/Y', $date);
                   echo "{$day->format('D')} | ";
                   foreach ($top3 as $employeeInfo) {
                       echo $employeeInfo.' ';
                   }
                   echo "\n";
                }
                
                Вывод:
                Mon | Jane (5.50 hours) John (4.50 hours)
                Tue | John (7.00 hours) Jane (6.00 hours)
                Wed | Leo (23.99 hours) John (7.03 hours) Jane (6.99 hours)
                 */
            }
        } catch (DAOException $e) {
            global $log;
            $log->error('DAOException in TimeReport::getReport(): Failed to get report', $e->toArray());
            throw new DomainException('Failed to get report', 0, $e);
        }
    }

}

<?php
namespace DAO;

class EmployeeDAO extends DAOConnection
{

    public function getCount()
    {
        $connection = null;
        try {
            $connection = $this->connect();
            $count = $connection->query("SELECT COUNT(*) FROM `employees`")->fetch();
            $count = (int) $count[0];
        } catch (\PDOException | \Error $e) {
            global $log;
            $log->error('PDOException (or Error) in EmployeeDAO::getCount(): Failed to get the count of employees', [$e->__toString()]);
            throw new DAOException('Failed to get the count of employees', 0, $e);
        } finally {
            $connection = null;
        }
        
        return $count;
    }
    
}

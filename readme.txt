Для начала нужно подтянуть в ./app либу логов. Композер - ./app/composer.json

Для запуска приложеия выполните ./app/index.php

Конфиги подключения к БД лежат в ./app/dao/DAOConnection.php

Временной интервал для выборки задаётся в ./app/dao/TimeReportDAO.php

Слабое место этого приложения в том, что может быть больше трёх записей
с одинаковым значением hours, попадающих в топ 3. В таком случае кто-то
из сотрудников не досчитается премии, хотя честно её заработал. Например:
|id|employee_id|employee.name|hours|  date  |
|21|     1     |    John     |  7  |5/8/2020|
|22|     2     |    Jane     |  7  |5/8/2020|
|23|     3     |    Mark     |  7  |5/8/2020|
|24|     4     |    Peter    |  7  |5/8/2020|
|27|     7     |    Lisa     |7.001|5/8/2020|
Как видно, в выборку должны попасть все пятеро, ибо 4 из них делят 2 и 3
места. Но в выборку попадают только Lisa, Jane и Peter.
Если поменять 7,001 на 7,009, то в выборке будут Lisa, Mark, Jane.
Таким образом, алгоритм выборки довольно непредсказуем и нечестен в случаях,
описанных выше. По идее, такое надо рефайнить с заказчиком...

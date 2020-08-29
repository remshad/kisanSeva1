<?php

require_once __DIR__ . '/vendor/autoload.php';

use Phpml\Regression\LeastSquares;
use Phpml\ModelManager;

$times  = array();
for($month = 1; $month <= 12; $month++) {
    $first_minute = mktime(0, 0, 0, $month, 1);
    $last_minute = mktime(23, 59, 59, $month, date('t', $first_minute));
    $times[$month] = array($first_minute, $last_minute);
}


$samples = [[73676, 1996], [77006, 1998], [10565, 2000], [146088, 1995], [15000, 2001], [65940, 2000], [9300, 2000], [93739, 1996], [153260, 1994], [17764, 2002], [57000, 1998], [15000, 2000]];
$targets = [2000, 2750, 15500, 960, 4400, 8800, 7100, 2550, 1025, 5900, 4600, 4400];

$regression = new LeastSquares();
$regression->train($samples, $targets);

$rnd=getName(10);
$filepath = getcwd()."/model/{$rnd}.txt";

$modelManager = new ModelManager();
$modelManager->saveToFile($regression, $filepath);

$restoredClassifier = $modelManager->restoreFromFile($filepath);
echo $restoredClassifier->predict([50000, 1996]); 



function getName($n) { 
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
    $randomString = ''; 
  
    for ($i = 0; $i < $n; $i++) { 
        $index = rand(0, strlen($characters) - 1); 
        $randomString .= $characters[$index]; 
    } 
  
    return $randomString._time(); 
} 

?>
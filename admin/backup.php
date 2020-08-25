<?php
set_time_limit(0); 
    
require('login1.php');   



$dat[]='user';
$dat[]='crop';
$dat[]='crop_category';
$dat[]='crop_price';
$dat[]='dealer';
$dat[]='dealer_language';
$dat[]='dealer_request';
$dat[]='dealer_to_farmer_msg';
$dat[]='district';
$dat[]='farmer';
$dat[]='farmer_language';
$dat[]='harvesting';
$dat[]='harvest_process';
$dat[]='language';

$dat[]='planting';
$dat[]='state';
$dat[]='unit_type';
$dat[]='village';


$data=EXPORT_DATABASE('kisanseva',$dat);
file_put_contents('../sql/kisanseva.sql',$data);

unlink("./backup/kisan.zip");
zipData('../','./backup/kisan.zip');
download('./backup/kisan.zip');





function EXPORT_DATABASE($name,$tables=false, $backup_name=false)
{ 
    global $link;
    $link->query("SET NAMES 'utf8'");
    $queryTables = $link->query('SHOW TABLES'); 
    while($row = $queryTables->fetch_row())
     { $target_tables[] = $row[0]; }	
     if($tables !== false) 
     { $target_tables = array_intersect( $target_tables, $tables); } 
	$content = "SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\";\r\nSET time_zone = \"+00:00\";\r\n\r\n\r\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\r\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\r\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\r\n/*!40101 SET NAMES utf8 */;\r\n--\r\n-- Database: `".$name."`\r\n--\r\n\r\n\r\n";
	foreach($tables as $table){
		if (empty($table)){ continue; } 
		$result	= $link->query('SELECT * FROM `'.$table.'`');  	$fields_amount=$result->field_count;  $rows_num=$link->affected_rows; 	$res = $link->query('SHOW CREATE TABLE '.$table);	$TableMLine=$res->fetch_row(); 
		$content .= "\n\n".$TableMLine[1].";\n\n";   $TableMLine[1]=str_ireplace('CREATE TABLE `','CREATE TABLE IF NOT EXISTS `',$TableMLine[1]);
		for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) {
			while($row = $result->fetch_row())	{ //when started (and every after 100 command cycle):
				if ($st_counter%100 == 0 || $st_counter == 0 )	{$content .= "\nINSERT INTO ".$table." VALUES";}
					$content .= "\n(";    for($j=0; $j<$fields_amount; $j++){ $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) ); if (isset($row[$j])){$content .= '"'.$row[$j].'"' ;}  else{$content .= '""';}	   if ($j<($fields_amount-1)){$content.= ',';}   }        $content .=")";
				//every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
				if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) {$content .= ";";} else {$content .= ",";}	$st_counter=$st_counter+1;
			}
		} $content .="\n\n\n";
	}
	$content .= "\r\n\r\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\r\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\r\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;";
	//$backup_name = $backup_name ? $backup_name : 'alhilal_('.date('H-i-s').'_'.date('d-m-Y').').sql';
	//ob_get_clean(); header('Content-Type: application/octet-stream');  header("Content-Transfer-Encoding: Binary");  header('Content-Length: '. (function_exists('mb_strlen') ? mb_strlen($content, '8bit'): strlen($content)) );    header("Content-disposition: attachment; filename=\"".$backup_name."\""); 
    return $content; 
    //exit;
}




function zipData($source, $destination) {
        if (extension_loaded('zip')) {
            if (file_exists($source)) {
                $zip = new ZipArchive();
                if ($zip->open($destination, ZIPARCHIVE::CREATE)) {
                  //  $source = realpath($source);
echo $source;

                  if (strstr($source,'/backup/')) 
                  {

                  }  
                  else if (is_dir($source)) {
                        $iterator = new RecursiveDirectoryIterator($source);
                        // skip dot files while iterating 
                        $iterator->setFlags(RecursiveDirectoryIterator::SKIP_DOTS);
                        $files = new RecursiveIteratorIterator($iterator, RecursiveIteratorIterator::SELF_FIRST);
                        foreach ($files as $file) {
                           // $file = realpath($file);
                            if (is_dir($file)) {
                                $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
                            } else if (is_file($file)) {
                                $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
                            }
                        }
                    } else if (is_file($source)) {
                        $zip->addFromString(basename($source), file_get_contents($source));
                    }
                }
                 //$zip->addFromString('page-icon.png', file_get_contents('../../page-icon.png'));
                //  $zip->addFromString('folder-icon.png', file_get_contents('../../folder-icon.png'));
                return $zip->close();
            }
        }
        return false;
    }
    
    
    function download($file_name) {
$file_url = $file_name;
$time=date('d_m_Y',time());
header('Content-Type: application/octet-stream');
header("Content-Transfer-Encoding: Binary"); 
header("Content-disposition: attachment; filename=\"kisanSeva_".$time."_backup.zip\""); 
readfile($file_url);
exit;
    }
<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    
$DIR=getcwd();

$output = shell_exec('FOLDER_STATUS.sh $DIR| sort -rk13');
echo "<table>";
echo "${output}";
echo "</table>"
?>

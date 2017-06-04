<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    

$output = shell_exec('FOLDER_STATUS.sh| sort -rk6');
echo "<table>";
echo "${output}";
echo "</table>"
?>
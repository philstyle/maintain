<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    

$output = shell_exec('FOLDER_STATUS.sh| sort -rk13');
echo "<table>";
echo "${output}";
echo "</table>"
?>
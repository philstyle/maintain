<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    
$DIR=getcwd();
$output = shell_exec("pushd .. 2>&1 > /dev/null && ./FOLDER_STATUS.sh $DIR| sort -rk8 && popd 2>&1 >/dev/null");
echo "<table>";
echo "${output}";
echo "</table>"
?>

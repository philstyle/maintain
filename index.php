<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    

$output = shell_exec('FOLDER_STATUS.sh');
//echo "<pre>$output</pre>";
//echo "<html><body>"
echo "${output}";
?>
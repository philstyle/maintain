<?php
if (isset($_POST['button']))
    {
         echo "poop";
    }
    

$output = shell_exec('FOLDER_STATUS.sh');
echo "<pre>$output</pre>";
?>

<html>
<body>
    <form method="post">
    <p>
        <button name="button">POOP</button>
    </p>
    </form>
</body>
</html>
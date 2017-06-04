<?php
if (isset($_POST['button']))
    {
         exec('FOLDER_STATUS.sh');
    }
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
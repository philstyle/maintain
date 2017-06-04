<html>
<head>
<style>
table {
    border-collapse: collapse;
    border: 1px solid black;
}
tr {
 border: 1px solid black;
}
</style>
</head>
<body>

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



</body>
</html>

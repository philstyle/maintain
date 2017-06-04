<html>
<head>
<style>
table {
    border-collapse: collapse;
    border: 1px solid black;
    height: 100%;
    width: 100%;
}
tr {
 border: 1px solid black;
}
td {
 text-align: center;
}
</style>
</head>
<body>

<?php
if (isset($_POST['BUTTON']))
    {
         //shell_exec("echo \"\"");
         echo "<pre>";
         $pressed = explode("-",$_POST['BUTTON']);
         print_r(explode("-",$_POST['BUTTON']));
         echo "</pre>";
         shell_exec("UPDATE.sh ${pressed[0]}.mt ${pressed[1]} 2>&1 >> /dev/null &");
         //echo "<meta http-equiv='refresh' content='0'>";
    }
    

$DIR=getcwd();
$output = shell_exec("pushd .. 2>&1 > /dev/null && ./FOLDER_STATUS.sh $DIR| sort -rk8 && popd 2>&1 >/dev/null");

echo "<table>";
echo "${output}";
echo "</table>"
?>



</body>
</html>

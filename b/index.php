<html>
<head>
<style>

.button1 {
    background-color: #4ca3af;
    border: none;
    color: black;
    padding: 5px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
}
.button2 {
    background-color: #608be0;
    border: none;
    color: black;
    padding: 5px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
}
.button1:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}
.button2:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}

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
       //  echo "<pre>";
         $pressed = $_POST['BUTTON'];
        // print_r($_POST['BUTTON']);
        // echo "</pre>";
         $DIR=getcwd();
         shell_exec("pushd .. 2>&1 > /dev/null && ./UPDATE.sh ${DIR}/${pressed}.mt 2>&1 >> /dev/null && popd 2>&1 >/dev/null");
         echo "<meta http-equiv='refresh' content='0'>";
    }
    

$DIR=getcwd();
$output = shell_exec("pushd .. 2>&1 > /dev/null && ./FOLDER_STATUS.sh $DIR| sort -rk8 && popd 2>&1 >/dev/null");
header("Refresh: 30;");
echo "<table>";
echo "${output}";
echo "</table>"
?>



</body>
</html>

<html>
<head>
<style>
table {
    border-collapse: collapse;
    border: 1px solid black;
    height: 100%;
    width: 100%;
}
.button1 {
    background-color: #4ca3af;
    border-radius: 6%;
    border: none;
    color: black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 1.5vmin;
    cursor: default;
    width: 12vmin;
    height: 12vmin;
}
.button2 {
    background-color: #608be0;
    border-radius: 6%;
    border: none;
    color: black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 2vmin;
    cursor: pointer;
    width: 16vmin;
    height: 14vmin;
}
.button3 {
    background-color: #404b90;
    border-radius: 6%;
    border: none;
    color: black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 2vmin;
    cursor: pointer;
    width: 14vmin;
    height: 8vmin;
}

.button1:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}
.button2:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}
.button3:hover {
    background-color: #4CAF50; /* Green */
    color: white;
}

tr {
 border: 1px solid black;
}
td {
 text-align: center;
 font-size: 3vmin;
 font-weight: bold;
}
</style>
</head>
<body>

<?php
if (isset($_POST['BUTTON']))
    {
         //shell_exec("echo \"\"");
         //echo "<pre>";
         $pressed = explode("-",$_POST['BUTTON']);
         //print_r(explode("-",$_POST['BUTTON']));
         //echo "</pre>";
         $DIR=getcwd();
         shell_exec("pushd .. 2>&1 > /dev/null && UPDATE.sh ${DIR}/${pressed[0]}.mt drew 2>&1 >> /dev/null && popd 2>&1 > /dev/null");
         echo "<meta http-equiv='refresh' content='0'>";
    }
    
$DIR=getcwd();
$output = shell_exec("pushd .. 2>&1 > /dev/null && FOLDER_OVERVIEW.sh ${DIR} | sort -rk16 && popd 2>&1 > /dev/null");
header("Refresh: 30;");
echo "<table>";
echo "${output}";
echo "</table>";


?>



</body>
</html>

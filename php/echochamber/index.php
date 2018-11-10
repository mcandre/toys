<?php

$text="";

if (array_key_exists("text", $_GET)) {
    $text=stripslashes($_GET["text"]);
}

$html = <<<HERE
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <title>Echochamber</title>
    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="stylesheet.css" media="screen" rel="stylesheet" type="text/css" />
</head>

<body>

<center>

<div id="form">

<form action="" method="get">
<p><textarea cols="100" id="text" name="text" rows="30"></textarea></p>
<p><button type="submit">Echo</button></p>
</form>

</div>

<div id="copyright">&copy; 2008 <a href="http://yellosoft.us/">YelloSoft</a></div>

</center>

</body>
</html>
HERE;

if ($text=="") {
    echo $html;
} else {
    echo $text;
}
?>

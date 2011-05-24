<?php

$min_dice=1;
$max_dice=100;
$min_sides=2;
$max_sides=100;

$roll="2d6";

if (!empty($_GET["roll"])) {
	$r=$_GET["roll"];
	if (filter_var($r, FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^[0-9]+d[0-9]+$/")))) {
		$roll=$r;
	}
}

$a=split("d", $roll);
$n=intval($a[0]);
$sides=intval($a[1]);

if ($n<$min_dice || $n>$max_dice || $sides<$min_sides || $sides>$max_sides) {
	$roll="2d6";
	$n=2;
	$sides=6;
}

$rolls=array();
for ($i=0; $i<$n; $i++) {
	$rolls[]=rand(1, $sides);
}

$results=join(", ", $rolls);
$sum=0;
for ($i=0; $i<$n; $i++) {
	$sum+=$rolls[$i];
} ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
	<title>Dice</title>
	<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="stylesheet.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="dice_form">

<form action="dice.php" method="get">

<p><input type="text" name="roll" size="5" value="<? echo $roll ?>" /></p>

<div id="roll_button">
<p><button type="submit">Roll</button></p>
</div>

</form>

<p><? echo $results ?></p>

<p>Sum: <? echo $sum ?></p>

</div>

</body>
</html>

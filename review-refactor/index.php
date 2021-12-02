<?php
require ('Insurance.php');

$insurance = new Insurance();
$quote = $insurance->quote();

var_dump($quote);
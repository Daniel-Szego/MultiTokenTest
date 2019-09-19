<?php
    echo 'Hello PHP Post Call!';
    echo PHP_EOL;
    echo PHP_EOL;
$processed = FALSE;
$ERROR_MESSAGE = '';

// ************* Call API:
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://localhost:3000/api/InitData");
curl_setopt($ch, CURLOPT_POST, 1);// set post data to true
//curl_setopt($ch, CURLOPT_POSTFIELDS,"username=myname&password=mypass");   // post data
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$json = curl_exec($ch);
curl_close ($ch);

if (!$processed && $ERROR_MESSAGE != '') {
    echo 'ERROR';
    echo PHP_EOL;
    echo $ERROR_MESSAGE;
}
else {

    echo $json;
    echo PHP_EOL;
}
?>

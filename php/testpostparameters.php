<?php
    echo 'Hello PHP Post Call with parameters!';
    echo PHP_EOL;
    echo PHP_EOL;
$processed = FALSE;
$ERROR_MESSAGE = '';

// ************* Call API:
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://localhost:3000/api/Like");
curl_setopt($ch, CURLOPT_POST, 1);// set post data to true
curl_setopt($ch, CURLOPT_POSTFIELDS,"walletId=erterk");   // post data
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
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

<?php
    echo 'Hello PHP get Call!';
    echo PHP_EOL;
    echo PHP_EOL;
$processed = FALSE;
$ERROR_MESSAGE = '';

// ************* Call API:
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://localhost:3000/api/queries/Query_TokenLikeTypes");
//curl_setopt($ch, CURLOPT_POST, 1);// set post data to true
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
    echo PHP_EOL;

    // returned json string will look like this: {"code":1,"data":"OK"}
    // "code" may contain an error code and "data" may contain error string instead of "OK"
    $obj = json_decode($json);

    foreach ($obj as &$resp) {

        echo PHP_EOL;
        echo 'Response item';
        echo PHP_EOL;

        echo '  TokenTypeID : ';
        echo $resp->{'tokenTypeId'};
        echo PHP_EOL;

        echo '  TokenTypeName : ';
        echo $resp->{'tokenTypeName'};
        echo PHP_EOL;

        echo '  TokenMasterType : ';
        echo $resp->{'tokenMasterType'};
        echo PHP_EOL;

        echo '  Supply : ';
        echo $resp->{'supply'};
        echo PHP_EOL;
    }
}
?>

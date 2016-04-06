<?php
//https://github.com/sanchobbdo/api-auth-client-plugin #source of AuthApi
// Include composer's autoload.
require 'vendor/autoload.php';

// Use required Guzzle classess.
use Guzzle\Http\Client;
use Guzzle\Http\Exception\ClientErrorResponseException;
use Guzzle\Http\Exception\BadResponseException;
use GuzzleHttpSignature\HttpSignaturePlugin;
use Guzzle\Http\Exception\CurlException;
use Guzzle\Log\Zf1LogAdapter;
use Guzzle\Plugin\Log\LogPlugin;
use Guzzle\Log\MessageFormatter;

// Use the api_auth plugin.
use SanchoBBDO\Guzzle\Plugin\ApiAuth\ApiAuthPlugin;

// Mount the client so that you can access it at \Guzzle
Guzzle\Http\StaticClient::mount(); //https://github.com/dchapkine/guzzle-http-signature


//$access_id = @ENV['KEY'];
//$access_id = "da6cc388-3381-4ef0-8f39-706f49a95d8d";
//$secret_key = @ENV['SECRET'];
//$secret_key = "dIiXikNJgaSKlo5o07BatGx3QV/DlvS70q2jYtKfq+rPhDbeuN9vuTllfE3DWFUZsNQl0LPRWE1V+ok4vG9FcQ==";

$access_id = "d2f95694-0972-48f4-be19-a7f82670a859";
$secret_key = "ADKNHnYcPMEMM3Y4P6EPz+KTmc4/n6ctDsQ8nzg8fwmxNfDO4r8uyBbSnTe9xzQBqCP4fHZ4g6KZb1SfWgNCTQ==";

//$requestUrl = "https://itrace.ruvixx.com/api/v1/incidents";
$requestUrl = "http://hdmi.ruvixx.local:5000/api/v1/incidents";
$requestMethod = 'POST';

date_default_timezone_set("GMT");

	$requestHeader = array(     // headers we want to include into signature
	    //'url' => $requestUrl,
	    //'method' => $requestMethod,
    	//'headers' => array (
    		'Content-Type' => "application/json"
  		//)
  	);

	$payload = array (  		 
    			'name' => "AV Invalid Scan - United States", # can be named anything
    			'incident_num' => "AV0001",
    			'incident_url' => "http://av.com/incident/13939",
    			'description' => "varchar(255)",
    			'incident_text' => "LONGTEXT",
    
    			'status' => array (
   		   			'id' => 1  # OPEN
    			),
    
    			'country' => array (
      				'name' => "United States"
    			),
    
    			'reporting_entity' => array (
      				'name' => "SAMPLE REPORTER"
    			),
    
    			'infringement_type' => array (
      				'id' => 7,
      				'name' => "Counterfeiting"
    			),
    
    			'incident_type' => array (
      				'id' => 4,
      				'name' => 'Website'
    			),
    
    			'incident_date' => date("Y-m-d"), # YYYY-MM-DD
    
   			 	'identified_unknown_products' => array ([      
       		 		'product' => array (
          				'model' => "MODELNUM",
          				'brand' => "BRANDNAME"
        			),
        			'qty' => 1,
        			'amount' => 29.99,
        			'technologies' => array ([  
            			'name' => "HDMI" # this has to match in the incident
          			])
      			])	    	
			 
		);
    
    $requestData = json_encode($payload);
    
	//$client = new Client();
	$client = new Client('http://hdmi.ruvixx.local:5000');
	$apiAuthPlugin = new ApiAuthPlugin(array(
    		'accessId' =>  $access_id,
    		'secretKey' =>  $secret_key
					)
		);  

	$client->addSubscriber($apiAuthPlugin);


try { 

	$request = $client->createRequest($requestMethod, $requestUrl,  $requestHeader, $requestData );

	$response = $request->send();

	echo ($request);
}

catch (ClientErrorResponseException $e)
// guzzle throws ClientErrorResponseException when error http codes are sent (401, 500, ...)
{
    $response = $e->getResponse();
}
catch (CurlException $e)
// the api provider is probably down or there is an issue with connection
{
    $msg = $e->getMessage();
}

//
// print response
//
//header('Content-Type: application/json');
if (isset($response))
	echo "\n" . $response->getStatusCode() . "\n" . $response->getBody(true) . "\n";
	
else
	echo $msg."\n";

?>

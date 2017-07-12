var CryptoJS = require("crypto-js");
var _ = require("lodash");

// -- DO NOT EDIT BELOW THIS LINE --
var ACCESS_KEY = postman.getEnvironmentVariable('access_id');
var SECRET = postman.getEnvironmentVariable('secret');

if(!ACCESS_KEY || !SECRET) {
    console.log("######## You must provide 'access_id' and 'secret' in environment variables #######");
    exit;
}

var path_regex = /(http:\/\/|https:\/\/)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?/;

console.log(request);
// postman.setGlobalVariable("variable_key", "variable_value");

console.log("body: ", request.data);

var method = request.method;
var content_type = 'application/json';
var content_md5 = CryptoJS.MD5(request.data).toString(CryptoJS.enc.Base64);
var url = _.replace(request.url, "{{hostname}}", postman.getEnvironmentVariable('hostname'));
console.log("url: "+url);
var path =  _.replace(url, path_regex, '');
var timestamp = new Date().toGMTString();

// 'HTTP method,content-type,content-MD5,request URI,timestamp'
var canonical_string = [method, content_type, content_md5, path, timestamp].join(',');

var authorization = CryptoJS.HmacSHA1(canonical_string, SECRET).toString(CryptoJS.enc.Base64);
var authorization_header = 'APIAuth ' + ACCESS_KEY + ':' + authorization;

console.log("canonical_string: ", canonical_string);
console.log("authoriztion_header: ", authorization_header);

// Set Headers
postman.setGlobalVariable('authorizationHeader', authorization_header);
postman.setGlobalVariable('contentMd5Header', content_md5.toString());
postman.setGlobalVariable('dateHeader', timestamp);
postman.setGlobalVariable('contentTypeHeader', content_type);


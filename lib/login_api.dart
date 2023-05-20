
import 'dart:convert';
import 'dart:io';

class LoginApi{

  static Future  fetch(String email, String password)
 async  {
        String url = 'https://apingweb.com/api/login';
        Map<String,String> body = {"email" : email,"password" : password};

        HttpClient httpClient = HttpClient();
        HttpClientRequest httpClientRequest =await httpClient.postUrl(Uri.parse(url));
        httpClientRequest.headers.set('content-type', 'application/json');
        httpClientRequest.add(utf8.encode(json.encode(body)));

        HttpClientResponse httpClientResponse = await httpClientRequest.close();
        String replay = await httpClientResponse.transform(utf8.decoder).join();

        print(replay);
        }



}
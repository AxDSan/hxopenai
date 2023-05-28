package hxopenai;

import haxe.Http;
import haxe.Json;

class Instance {
    private var openai_api_key:String = "";
    private var openai_org_id:String = "";

    private var url:String = "https://api.openai.com/" + "v1" + "/";
    public static var debug:Bool = false;

    public function new() { }

    public function setApiKey(t:String) { this.openai_api_key = t; }
    public function setOrgId(oid:String) { this.openai_org_id = oid; }

    public function makeRequest(method:String, body:Dynamic):Dynamic {
        var json:Dynamic;
        if (openai_api_key == "")
        {
            #if sys
            Sys.println("[hxopenai] Token not specified. Try setting it with setApiKey()");
            #else
            trace("[hxopenai] Token not specified. Try setting it with setOrgId()");
            #end
            json = "";
        }
        else
        {
            var _data:String;
            var r = new haxe.Http(url + method);
            
            r.addHeader("User-Agent", "hxopenai (https://github.com/FurretDev/hxdiscord)");
            r.addHeader("Content-Type", "application/json");
            r.addHeader("Authorization", "Bearer " + openai_api_key);
            if (openai_org_id != null)
            {
                r.addHeader("OpenAI-Organization", openai_org_id);
            }
            
            r.setPostData(haxe.Json.stringify(body));
            
		    r.onData = function(data:String)
		    {
                if (debug)
                {
                    trace(data);
                }
                json = haxe.Json.parse(data);
		    }
        
		    r.onError = function(error)
		    {
		    	trace("[hxopenai] An error has occurred: " + error);
                if (r.responseData == null || r.responseData == "" || r.responseData == " ")
                {
                    json = error;
                }
                else
                {
                    json = r.responseData;
                }
		    }
        
		    r.request(true);
        }
        return json;
    }

    public function createTextCompletion(tc:Typedefs.TextCompletion):Dynamic {
        return makeRequest("completions", tc);
    }

    public function createChatCompletion(cc:Typedefs.ChatCompletion):Dynamic {
        return makeRequest("chat/completions", cc);
    }

    public function createImage(ic:Typedefs.CreateImage):Dynamic {
        return makeRequest("images/generations", ic);
    }

    public function createEdit(ce:Typedefs.CreateEdit)
    {
        return makeRequest("edits", ce);
    }
}

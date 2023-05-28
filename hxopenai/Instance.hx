package hxopenai;

import haxe.Http;
import haxe.Json;

class Instance {
    private var openai_token:String = "";
    private var openai_org:String = "";

    private var url:String = "https://api.openai.com/" + "v1" + "/";
    public static var debug:Bool = false;

    public function new() { }

    public function setToken(t:String) { this.openai_token = t; }
    public function setOrgID(oid:String) { this.openai_org = oid; }

    public function createTextCompletion(tc:Typedefs.TextCompletion):Dynamic {
        var json:Dynamic;
        if (openai_token == "")
        {
            #if sys
            Sys.println("[hxopenai] Token not specified. Try setting it with setToken()");
            #else
            trace("[hxopenai] Token not specified. Try setting it with setOrgID()");
            #end
            json = "";
        }
        else
        {
            var _data:String;
            var r = new haxe.Http(url + "completions");
            
            r.addHeader("User-Agent", "hxopenai (https://github.com/FurretDev/hxdiscord)");
            r.addHeader("Content-Type", "application/json");
            r.addHeader("Authorization", "Bearer " + openai_token);
            if (openai_org != null)
            {
                r.addHeader("OpenAI-Organization", openai_org);
            }
            
            r.setPostData(haxe.Json.stringify(tc));
            
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

    public function createChatCompletion(cc:Typedefs.ChatCompletion):Dynamic {
        var json:Dynamic;
        if (openai_token == "")
        {
            #if sys
            Sys.println("[hxopenai] Token not specified. Try setting it with setToken()");
            #else
            trace("[hxopenai] Token not specified. Try setting it with setOrgID()");
            #end
            json = "";
        }
        else
        {
            var _data:String;
            var r = new haxe.Http(url + "chat/completions");
            
            r.addHeader("User-Agent", "hxopenai (https://github.com/FurretDev/hxdiscord)");
            r.addHeader("Content-Type", "application/json");
            r.addHeader("Authorization", "Bearer " + openai_token);
            if (openai_org != null)
            {
                r.addHeader("OpenAI-Organization", openai_org);
            }
            
            r.setPostData(haxe.Json.stringify(cc));
            
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


    public function createImage(ic:Typedefs.CreateImage):Dynamic {
        var json:Dynamic;
        if (openai_token == "")
        {
            #if sys
            Sys.println("[hxopenai] Token not specified. Try setting it with setToken()");
            #else
            trace("[hxopenai] Token not specified. Try setting it with setOrgID()");
            #end
            json = "";
        }
        else
        {
            var _data:String;
            var r = new haxe.Http(url + "images/generations");
            
            r.addHeader("User-Agent", "hxopenai (https://github.com/FurretDev/hxdiscord)");
            r.addHeader("Content-Type", "application/json");
            r.addHeader("Authorization", "Bearer " + openai_token);
            if (openai_org != null)
            {
                r.addHeader("OpenAI-Organization", openai_org);
            }
            
            r.setPostData(haxe.Json.stringify(ic));
            
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

    public function createEdit(ce:Typedefs.CreateEdit)
    {
        var json:Dynamic;
        if (openai_token == "")
        {
            #if sys
            Sys.println("[hxopenai] Token not specified. Try setting it with setToken()");
            #else
            trace("[hxopenai] Token not specified. Try setting it with setOrgID()");
            #end
            json = "";
        }
        else
        {
            var _data:String;
            var r = new haxe.Http(url + "edits");
            
            r.addHeader("User-Agent", "hxopenai (https://github.com/FurretDev/hxdiscord)");
            r.addHeader("Content-Type", "application/json");
            r.addHeader("Authorization", "Bearer " + openai_token);
            if (openai_org != null)
            {
                r.addHeader("OpenAI-Organization", openai_org);
            }
            
            r.setPostData(haxe.Json.stringify(ce));
            
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
}
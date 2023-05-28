# HxOpenAI

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://axdsan.mit-license.org/)
[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/your-username/your-library)

A Haxe library for interacting with the OpenAI API.

**Credits**: This library is inspired by the work of [FurretDev](https://github.com/FurretDev).


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [API Reference](#api-reference)
- [Contributing](#contributing)
- [License](#license)

## Installation

You can install the library using the following methods:

- Method 1: Add it as a dependency in your `haxelib.json` file:
```json
{
  "dependencies": {
    "hxopenai": "1.0.0"
  }
}
```

- Method 2: Install it using Haxelib:
```bash
haxelib install hxopenai
```

## Usage

Import the library in your Haxe code:
```haxe
import hxopenai.Instance;
```

Create an instance of the library:
```haxe
var instance = new Instance();
instance.setApiKey("YOUR_OPENAI_API_KEY");
instance.setOrgId("YOUR_OPENAI_ORG_ID");
```

> You can obtain a openai api key from https://platform.openai.com/account/api-keys 

Make requests to the OpenAI API using the available methods:
```haxe
var textCompletion = {
  model: "your_model",
  prompt: "your_prompt",
  // Additional parameters...
};

var response = instance.createTextCompletion(textCompletion);
```

## Examples

If you're not a code adept and don't really want to dig the documentation (under construction) here you can find some bites set out for you; Examples on how you can use the library.

```haxe
// Example 1 - TextCompletion using `text-davinci-003`
import hxopenai.*;

class Main {
    static function main() {
        var instance = new Instance();
        instance.setApiKey("<YOUR-OPENAI-API-KEY>");

        // Create a text completion.
        var textCompletion:Typedefs.TextCompletion = {
            prompt: "Once upon a time",
            max_tokens: 256,
            top_p: 1,
            n: 1,
            stream: false,
            logprobs: null,
            echo: false,
            stop: ["\n"],
            model: "text-davinci-003",
        };

        // Make the request.
        var response = instance.createTextCompletion(textCompletion);

        // Print the response.
        trace(response.choices[0].text);
    }
}
```

```haxe
// Example 2 - ChatCompletion using `gpt-3.5-turbo`
import hxopenai.*;

class Main {
    static function main() {
        var instance = new Instance();
        instance.setApiKey("<YOUR-OPENAI-API-KEY>");

        Example usage of createChatCompletion
        var chatCompletion:Typedefs.ChatCompletion = {
            model: "gpt-3.5-turbo",
            messages: [
                {
                    role: "user",
                    content: "Hey there!"
                }
            ]
        };
        var chatCompletionResult = instance.createChatCompletion(chatCompletion);
        var messageContent = chatCompletionResult.choices[0].message.content;
        trace(messageContent);
    }
}

```

## API Reference

### Instance

#### `new()`

Creates a new instance of the library.

#### `setApiKey(token:String)`

Sets the OpenAI token to authenticate API requests.

#### `setOrgId(orgId:String)`

Sets the OpenAI organization ID.

#### `makeRequest(method:String, body:Dynamic):Dynamic`

Makes a request to the OpenAI API using the specified method and request body.

#### `createTextCompletion(tc:Typedefs.TextCompletion):Dynamic`

Creates a text completion request.

#### `createChatCompletion(cc:Typedefs.ChatCompletion):Dynamic`

Creates a chat completion request.

#### `createImage(ic:Typedefs.CreateImage):Dynamic`

Creates an image generation request.

#### `createEdit(ce:Typedefs.CreateEdit)`

Creates an edit request.

### Typedefs

This section provides the typedefs used in the library. Refer to the source code for detailed information about each typedef.

## Contributing

Contributions are welcome! Please refer to the `CONTRIBUTING.md` file for guidelines.

## License

This library is licensed under the [MIT License](LICENSE).

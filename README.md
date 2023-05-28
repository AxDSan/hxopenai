# Your Library Name

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/your-username/your-library)

Short description or tagline for your library.

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
    "your-library": "1.0.0"
  }
}
```

- Method 2: Install it using Haxelib:
```bash
haxelib install your-library
```

## Usage

Import the library in your Haxe code:
```haxe
import hxopenai.Instance;
```

Create an instance of the library:
```haxe
var instance = new Instance();
instance.setToken("YOUR_OPENAI_TOKEN");
instance.setOrgID("YOUR_OPENAI_ORG_ID");
```

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

Provide some usage examples or code snippets to demonstrate the functionality of your library.

```haxe
// Example 1
var instance = new Instance();
// Your code here...

// Example 2
// Your code here...
```

## API Reference

### Instance

#### `new()`

Creates a new instance of the library.

#### `setToken(token:String)`

Sets the OpenAI token to authenticate API requests.

#### `setOrgID(orgId:String)`

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

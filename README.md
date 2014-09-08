# Kurumi

Use MIRA to train a large amount of features.

Segment chinese(both traditional and simplized) sentences into words in high speed and correctly.

take care the name of the gem is different from the repo name!
## Installation

Add this line to your application's Gemfile:

    gem 'cseg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cseg

you need to install [CRF++](http://crfpp.googlecode.com/svn/trunk/doc/index.html?source=navbar) first and set the environment variables.

On github the dictionary file was deleted since it is quite large, though you can get all from rubygems.

## recall and Precision

Tested on seghanbakeoff pku test set

Precision: 94.43%

Recall: 92.86%
	
## Usage

```
The default is Simplified Chinese
    require "cseg"
    a=Kurumi.segment("屌丝是一种自我讽刺。")
=>["屌丝", "是", "一", "种", "自我", "讽刺", "。"]
Use parameter "tr" to specify Traditional Chinese
    a=Kurumi.segment("台妹真是正點。","tr")  
=>["台妹", "真", "是", "正點", "。"]	

```	

## Contributing

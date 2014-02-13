# Cseg

Use MIRA to train a large amount of features.

Segment chinese sentences into words in high speed and correctly.

## Installation

Add this line to your application's Gemfile:

    gem 'cseg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cseg

you need to install CRF++ first and set the environment environment variables.

Here is the site of CRF++<http://crfpp.googlecode.com/svn/trunk/doc/index.html> and you should follow the manual

On github the dictionary file was deleted since it is quite large, though you can get all from rubygems.
	
## Usage

    require "cseg"
    a=Kurumi.segment("屌丝是一种自我讽刺")
    
    =>屌丝/是/一/种/自我/讽刺
	
	the result will be an array.
	

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

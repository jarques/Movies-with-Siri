Movies with Siri
================

Note: Movies with Siri is no longer maintained. Siri now includes movie information, you're welcome for the idea Apple!

About
-----
This is a simple plugin for SiriProxy (https://github.com/plamoni/SiriProxy) that lets you check the Rotten Tomatoes score for your favorite movies.

How to Use
----------

Once you have SiriPorxy up and running. Place movies.rb in /plugins/movies/, in start.rb add the following:

<pre>
require 'plugins/movies/movies'
PLUGINS = [Movies]
</pre>

Next, run Siri and ask "what is the rating of avatar"

Upcoming
--------

Right now Movies with Siri only works with "what is the rating of *movie*." Future phrases may be supported, like "how well did *movie* do" or "should I watch *movie*"

Disclaimer
----------

I do not work nor am I affiliated with Apple. I don't condone any illegal activities when it comes to Siri or any Apple trademarks. Use SiriProxy and this plugin at your own discretion and I won't take responsibility for any broken iPhones, Computers or banned UDIDs.
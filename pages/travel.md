---
layout: page
subheadline: ""
title: "Simple traveler."
teaser: ""
header:
   image_fullwidth: "header-bus.jpg"
permalink: "/travel/"
---
<ul>
    {% for post in site.tags.header %}
    <li><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
</ul>

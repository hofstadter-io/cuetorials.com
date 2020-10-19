+++
title = "Code"
description = ""
weight = 4
+++

Add code to your page with syntax highlighting and a copy button so your users can easily copy the code to their clipboard with the press of a button. The code may be entered inside the shortcode or come from an external file.

{{< code lang="html" >}}
<div class="mydiv bg-primary shadow text-white">
	<h1 class="title">Hi there</h1>
	<p class="lead">I'm inside a code shortcode. Check out my syntax highlighting!.</p>
</div>
{{< /code >}}

## Usage
Simply place the following shortcode on the page
#### Code in the shortcode
{{< code lang="html" >}}
{{</* code lang="LANG" */>}} [your code] {{</* /code */>}}
{{< /code >}}
#### Code from a file
{{< code lang="html" >}}
{{</* code lang="LANG" file="code/mycode.html" */>}}
{{< /code >}}



### Parameters
#### *lang*
The lang parameter defines the language to be used for code highlighting. You can find a complete list of supported languages <a href="https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages" target="_blank">here</a>.

Example: <code>lang="html"</code>

#### *file*
The file parameter allows you to define an external file that contains your code to be displayed. This is done by giving a path to that file, starting from the root directory of your site.
For example, a HTML file named *'mycode.html'* you wish to link that is in the *docs/code/* directory can be defined as follows: <code>file="code/mycode.html"</code>.

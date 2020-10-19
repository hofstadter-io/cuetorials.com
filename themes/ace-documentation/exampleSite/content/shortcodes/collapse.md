+++
title = "Collapse"
description = ""
weight = 5
+++

Feel like hiding some content from your visitor in a collapsible element? The collapse shortcode does exactly that. It creates a button that shows or hides the content in the shortcode on request.

{{< collapse title="Click me to show content" >}}
Hi there, I'm the hidden content. Didn't see that one coming, huh?
{{< /collapse >}}

## Usage
Simply place the following shortcode on the page
{{< code lang="html" >}}
{{</* collapse title="TITLE" */>}} [content] {{</* /collapse */>}}
{{< /code >}}


### Parameters
#### *title*
The lang parameter defines the text to show in the button that toggles the collapse content.
Example: <code>title="Click me to show content"</code>.

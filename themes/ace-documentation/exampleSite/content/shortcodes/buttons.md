+++
title = "Buttons"
description = ""
weight = 2
+++

The button shortcode allows you to add a button to the page. This button is a HTML *anchor* element and can thus be used to link to another page or website.

{{< button style="primary" >}} Button {{< /button >}}
{{< button style="secondary" >}} Button {{< /button >}}
{{< button style="outline-primary" >}} Button {{< /button >}}
{{< button style="danger" >}} Button {{< /button >}}
{{< button style="warning" >}} Button {{< /button >}}
{{< button style="success" >}} Button {{< /button >}}
{{< button style="info" >}} Button {{< /button >}}

## Usage
Place the following shortcode on the page
{{< code lang="html" >}}
{{</* button style="STYLE" link="https://yourwebsite.com" */>}} [content] {{</* /button */>}}
{{< /code >}}

### Parameters
#### *style*
The style parameter is directly applied to the alert as a class in the format *"btn-{STYLE}"*. Bootstrap comes with a variety of styles that can be used with this:
- primary
- secondary
- danger
- warning
- success
- info

Each style can also be presented as an 'outline' variant by prefixing the style with 'outline-'.
Example: <code>style="outline-primary"</code>.

#### *link*
The link parameter may consist of an URL leading to a page or other website. Simply use it by defining a URL for the button to link to.
Example: <code>link="https://google.com"</code>.

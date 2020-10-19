+++
title = "Panel"
description = ""
weight = 8
+++

Draw your visitor's attention by separating information from the rest of the page using a panel. Convey meaning to this information by using colors implying danger, warning, success or info in a similar fashion as alerts.

{{< panel title="I'm important" style="danger" >}}
Be sure to read me, I might have important information for you.
{{< /panel >}}

## Usage
Simply place the following shortcode on the page
{{< code lang="html" >}}
{{</* panel title="TITLE" style="STYLE" */>}} [content] {{</* /panel */>}}
{{< /code >}}

### Parameters
#### Style
The style parameter is directly applied to the alert as a class in the format *"border-{STYLE}"*. Bootstrap comes with a variety of styles that can be used with this:
- primary
- secondary
- danger
- warning
- success
- info
Example: <code>style="danger"</code>.

#### Title
The title parameter defines the text shown as a title in the panel. It will have the same color as the style.
Example: <code>title="I'm important"</code>.

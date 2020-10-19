+++
title = "Alerts"
description = ""
weight = 1
+++

The alerts shortcode allows you to let information stand out by means of an alert styled box. This can be used to indicate danger, warning, success or info.

{{< alert style="danger" >}} I'm a danger alert {{< /alert >}}
{{< alert style="warning" >}} I'm a warning alert {{< /alert >}}
{{< alert style="success" >}} I'm a success alert {{< /alert >}}
{{< alert style="info" >}} I'm an info alert {{< /alert >}}

## Usage
Place the following shortcode on the page
{{< code lang="html" >}}
{{</* alert style="STYLE" */>}} [content] {{</* /alert */>}}
{{< /code >}}

### Parameters
#### Style
The style parameter is directly applied to the alert as a class in the format *"alert-{STYLE}"*. Bootstrap comes with four styles that can be used with this:
- danger
- warning
- success
- info

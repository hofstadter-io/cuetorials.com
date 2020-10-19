+++
title = "Table"
description = ""
+++

The table shortcode allows you to wrap your tables in a <code>table</code> class, providing styling to the table such as borders, stripes and hover effects.

{{< table >}}
| Tables        | are           | cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
{{< /table >}}

## Usage
Place the following shortcode on the page
{{< code lang="html" >}}
{{</* table style="STYLE" */>}}
| Tables        | are           | cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
{{</* /table */>}}
{{< /code >}}

### Parameters
#### Style
The style parameter is directly applied to the table as a class in the format *"{STYLE}"*. Bootstrap comes with several styles that can be used with this:
- table-striped
- table-dark
- table-bordered
- table-hover

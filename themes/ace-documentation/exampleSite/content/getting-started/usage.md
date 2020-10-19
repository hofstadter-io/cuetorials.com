+++
title = "Usage"
description = ""
weight = 2
+++

{{< lead >}}
With the site created and the theme installed, it's time to run the server and create content.
{{< /lead >}}

## Starting & building the site
### Development server
To start the site for development mode, execute the following command while in your <code>/docs</code> folder:
{{< code lang="bash" >}}
hugo server
{{< /code >}}
This will start a server on your localhost that will live-update with any changes you make to your site.

For more Hugo commands visit <a href="https://gohugo.io/commands/" target="_blank">https://gohugo.io/commands/</a>

### Building for production
To build the site for your production environment, as in, to serve it to your users through a web server, execute the following command. This will create a folder <code>/docs/public</code> with all the necessary files, compiled to HTML.

<br>Be sure the site's configuration in <code>config.toml</code> is complete, including the <code>baseURL = "https:&#47;&#47;yourdomain.com/"</code> value to properly load stylesheets and other resources.
{{< code lang="bash" >}}
hugo
{{< /code >}}


## Creating content
### Markdown
Pages are written in Markdown and files defining pages should end with *.md*. For more information on how to use Markdown, search for tutorials on the internet or use this <a href="https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet" target="_blank">cheatsheet</a>.

### File structure
Ace looks at your file structure and automatically turns it into a menu.
The structure looks as follows:
{{< code >}}
/content
├── _index.md
├── page-top.md
└── /level-one
    ├── _index.md
    ├── page-1-one.md
    ├── page-1-two.md
    └── /level-two
        ├── _index.md
        ├── page-2-one.md
        ├── page-2-two.md
        └── /level-three
            ├── _index.md
            ├── page-3-one.md
            ├── page-3-two.md
            └── /level-four
                ├── page-4-one.md
                └── page-4-two.md
{{< /code >}}

Your 'homepage' for every level is the <code>_index.md</code> file. Subpages (like <code>page-1-one.md</code>) are automatically added as child pages in the menu.

An exception exists for the top level files. <code>/content/_index.md</code> is your homepage, and any other page files in the <code>/content</code> folder are not automatically added in the menu. Instead, they can be accessed manually through their URL (<code>yourdomain.com/page-title</code>).

### File contents
Every file should start by defining the title and weight of the page. This can be done by adding the following text to the top of your page file.
{{< code lang="markdown" >}}
+++
title = "Usage"
description = ""
weight = 2
+++
{{< /code >}}
The title will be displayed as a H1 header at the top of your page. The weight determines the order in the menu.

After that you may write the content you desire with Markdown. You may use shortcodes to add some more 'advanced' layout features to the page, such as code highlighting, a 'lead' style paragraph, images, video's, and more.

### Navigation bar menu
While the left sidebar navigation is automatically populated by the file structure described above, and the right 'table of contents' sidebar menu is automatically populated by the headings defined on a page, the top navigation bar needs to be configured manually.
<br>
This can be done in the <code>config.toml</code> file, by adding the following lines:
{{< code lang="toml" >}}
[[menu.shortcuts]]
name = "<i class='fab fa-github'></i>"
url = "https://github.com/vantagedesign/ace-documentation"
weight = 10
{{< /code >}}

This example will create a GitHub icon that links to that URL. Instead of an icon, you may also use text, or both.

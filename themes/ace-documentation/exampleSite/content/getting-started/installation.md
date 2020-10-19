+++
title = "Installation"
description = ""
weight = 1
+++

{{< lead >}}
Installing Ace is easy. Just install the Hugo binary, create a new site and install the Ace theme.
{{< /lead >}}

## Installing Hugo
In order to run this theme, you need to install Hugo on your system.
This theme requires Hugo's extended version to support SCSS compilation, so make please sure you install the extended version.
For more detailed information and other methods of installation you can visit the <a href="https://gohugo.io/getting-started/installing/" target="_blank">Hugo installation guide</a>.

There may be other ways to install Hugo that are more applicable for your project. For example, you can use the NPM package <a href="https://www.npmjs.com/package/hugo-bin" target="_blank">hugo-bin</a> to include Hugo in a project that already uses NPM packages.

### Checking your Hugo installation
Run the following command in your terminal to check if Hugo is installed.
{{< code lang="bash" >}}
hugo version
{{< /code >}}
Make sure the version name mentions <i>extended</i>, to indicate you've installed the extended version of Hugo, which is required for this theme.

## Creating a site
Create a new site *docs* (you may choose any name you want). In your projects root folder, run the following command:
{{< code lang="bash" >}}
hugo new site docs
{{< /code >}}
This will create a new folder <code>/docs</code> with all required files in it.

### Installing the theme
Download and copy the theme files into <code>/docs/themes/ace-documentation</code> or use <i>git</i> to clone the repository to that directory:
{{< code lang="bash" >}}
cd docs
cd themes
git clone https://github.com/vantagedesign/ace-documentation
{{< /code >}}

After theme installation, the <code>/docs/themes/ace-documentation</code> folder should contain the file <code>theme.toml</code>, along with all other theme files.

### Configuring your hugo site to use the theme
Inside your site's folder, <code>/docs</code>, you will find a file called <code>config.toml</code>. This is the configuration file for your site. Open it and configure it to use the Ace theme by setting the following value:
{{< code lang="toml" >}}
theme = "ace-documentation"
{{< /code >}}


## Installing example content
You can add some sample content to your site by placing the contents of the <code>exampleSite</code> directory in your <code>/docs</code> directory.

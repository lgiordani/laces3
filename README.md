# Laces3

This is a Bootstrap 3 theme for Pelican. It is an enhancement of the amazing [pelican-bootstrap3](https://github.com/DandyDev/pelican-bootstrap3) by [Daan Debie](https://github.com/DandyDev).

I started to pull changes submitted by other developers into my own fork of pelican-bootstrap3 and ended up with a complete mess, so I decided to try and rebuild the original theme with the changes I had in mind.

I submitted some changes to pelican-bootstrap3, but I understand that that project has its own pace and I wanted to use or try some new features. So this is more a bleeding edge version of pelican-bootstrap3 than a new theme.

So I want to acknowledge that everything you find in this project at its very start comes from pelican-bootstrap3 and is here thanks to many contributors that developed it.

## CONTRIBUTING

If you want to adjust this theme to your own liking, I encourage you to fork it. If you make improvements that are useful to others and can make the theme better in general **please don't hesitate to make a pull request**. For contributing guidelines, [look here](CONTRIBUTING.md).

## Installation

Enter the pelican directory and execute

``` sh
git clone https://github.com/lgiordani/Laces3.git
```

Open the `pelicanconf.py` file in the same directory and change the `THEME` variable to `pelican-bootstrap3`

``` python
THEME = "pelican-bootstrap3"
```

then add the With Statement Jinja2 extension into the same file

``` python
JINJA_EXTENSIONS = ['jinja2.ext.with_']
```

(just add the `'jinja2.ext.with_'` string to the list if you already have some Jinja2 extensions activated).

## Naming convention

Every configurable variable used in Laces3 has a name that starts with `LACES_`. This allows you to clearly differentiate the theme variables from the Pelican ones. Internal theme variables names start with `_laces`.

## Content Delivery Network

I get many parts of the theme from CDNs, to keep the theme in a lightweight form. If for some reason you prefer to use local content just set

``` python
LACES_CONTENT_<content_name>_LOCAL = True
```

where `<content_name>` is the relative content name like `BOOTSTRAP` or `JQUERY`, and put your content in `Laces3/local_content/<lowercase content_name>` (e.g. `laces3/local_content/bootstrap`).

Some parts of the theme come in different versions (Bootstrap for example). In that case the theme also defines a `LACES_CONTENT_<content_name>_VERSION` used to pick the correct content from the delivery network. If you are using local content you have to manually link the correct version, since Laces3 does not use the version number in that case.

As an example take the `BOOTSTRAP` content. Laces3 defines the following variables

``` python
LACES_CONTENT_BOOTSTRAP_LOCAL = False
LACES_CONTENT_BOOTSTRAP_VERSION = '3.3.5'
```

and as a result the HTML of your site contains the following HTML

``` HTML
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
```

If you want to use a different version of Bootstrap (for example your own fork) just set

```
LACES_CONTENT_BOOTSTRAP_LOCAL = True
```

and put your Bootstrap 3 version into `laces3/local_content/bootstrap` (assuming you cloned Laces3 into the `laces3` directory).

The full list of CDN content is the following:

* `BOOTSTRAP` - The main theme component, [(Twitter) Bootstrap 3](http://getbootstrap.com/)
* `FONT_AWESOME` - The awesome [Font Awesome](https://fortawesome.github.io/Font-Awesome/)
* `BOOTSWATCH` - Bootstrap themes from [Bootswatch](http://bootswatch.com/). If you set the `LACES_CONTENT_BOOTSWATCH_THEME` that theme will be used instead of the Bootstrap default one.
* `JQUERY` - [jQuery](http://jquery.com/)
* `RESPONDJS` - [respond.js](https://github.com/scottjehl/Respond)

## Configuration

In this part you find a subsection for every component of Laces3. This theme tries to keep its components as separate as possible.

Some feature may be activated or deactivated setting to `True` a variable named `LACES_<feature_name>` (e.g. The Pager featureis activated by setting `LACES_PAGER = True`).

If a feature has a single configuration parameter it is activated directly defining that parameter (e.g. The Custom CSS feature is activated setting the `LACES_CUSTOM_CSS` variable to the value of the custom file).

If a feature has more than one configuration parameter it is defined as a dictionary containing the configuration keys. The name of the dictionary is in the same form of the simpler flags described above, and by convention the keys of the dictionary are lowercase (see `LACES_BREADCRUMBS` for example). If default values are good for you you can also set such variables to `True`.

### Pelican settings

Some configuration variables come from Pelican itself. They are named according to the Pelican convention, their complete description is [on the official documentaion](http://docs.getpelican.com/en/latest/settings.html).

The following Pelican settings are used in this theme

* AUTHOR
* DISPLAY_PAGES_ON_MENU
* DISPLAY_CATEGORIES_ON_MENU
* PATH
* PLUGINS
* SITENAME
* SITEURL
* TYPOGRIFY
* FEED_ATOM
* FEED_ALL_ATOM
* FEED_ALL_RSS
* CATEGORY_FEED_ATOM
* TAG_FEED_ATOM
* DEFAULT_LANG
* THEME
* THEME_STATIC_DIR
* DISQUS_SITENAME
* GOOGLE_ANALYTICS
* MENUITEMS
* PIWIK_URL
* PIWIK_SSL_URL
* PIWIK_SITE_ID
* LINKS
* SOCIAL
* TWITTER_USERNAME

### Pygments

Flag: `LACES_PYGMENTS_STYLE`

You can choose the syntax highlighting style by using the `LACES_PYGMENTS_STYLE` variable to specify one of the built-in Pygments styles. By default the `native` style is used. For a demo of the different Pygment styles, have a look [here](http://richleland.github.io/pygments-css/)

### Custom CSS

Flag: `LACES_CUSTOM_CSS`
Pelican variables: `STATIC_PATHS`, `EXTRA_PATH_METADATA`

If you want to add custom css to the theme, without having to clone and maintain your own version of the theme, you can use the `LACES_CUSTOM_CSS` variable. The value is the location where you tell Pelican to put the file (see below):

```
LACES_CUSTOM_CSS = 'static/custom.css'
```

To tell Pelican to copy the relevant file to the desired destination, add the path to `STATIC_PATHS` and the destination to `EXTRA_PATH_METADATA`, like so:

```
# Tell Pelican to add 'extra/custom.css' to the output dir
STATIC_PATHS = ['images', 'extra/custom.css']

# Tell Pelican to change the path to 'static/custom.css' in the output dir
EXTRA_PATH_METADATA = {
    'extra/custom.css': {'path': 'static/custom.css'}
}
```

### Pagination

Flag: `LACES_PAGER`

Laces3 follows the standard Pagination settings of Pelican and uses the Bootstrap3 [Pagination component](http://getbootstrap.com/components/#pagination), but you can optionally use the Boostrap3 _Pager_ by setting `LACES_PAGER` to `True`.

### Bootstrap fluid layout

Flag: `LACES_BOOTSTRAP_FLUID`

If you'd like to use the fluid container layout from Bootstrap, set the flag `LACES_BOOTSTRAP_FLUID` to `True`.

### Hiding the site name

Flag: `LACES_HIDE_SITENAME`

By default Laces3 shows the value of the `SITENAME` Pelican variable. If you want to hide it (for example when showing a logo, see "Site logo") set the `LACES_HIDE_SITENAME` variable to `True`.

### Site logo

Configuration variable: `LACES_SITELOGO`
Configuration keys: `file`, `width`

You can provide a logo for your site through `LACES_SITELOGO`. The `file` configuration value contains the image file, while the `width` value forces the width of the resulting `<img>` tag.

By default the value of the `SITENAME` Pelican variable will be shown as well. It's possible to hide it using the `LACES_HIDE_SITENAME` flag.

Example:

``` python
LACES_SITELOGO = {
    'FILE': 'images/my_site_logo.png',
    'WIDTH': 100,
}
```

### Breadcrumbs

Configuration variable: `LACES_BREADCRUMBS`
Configuration keys: `display_category`

It's possible to show breadcrumbs in your site using the `LACES_BREADCRUMBS` flag. By default the article category isn't shown in the breadcrumbs, if you wish to enable it, set the `display_category` configuration flag to `True`.

If you just want to activate breadcrumbs with the default settings set 

``` python
LACES_BREADCRUMBS = True
```

### Navbar

Configuration flag: `LACES_BOOTSTRAP_NAVBAR_INVERSE`

If you wish to use the inverse navbar from Bootstrap, set the flag `LACES_BOOTSTRAP_NAVBAR_INVERSE` to `True`.

### Related Posts

Configuration flag: `LACES_RELATED_POSTS_HEADER`

This theme has support for the [Related Posts plugin](https://github.com/getpelican/pelican-plugins/tree/master/related_posts). All you have to do, is enable the plugin, and the theme will do the rest.

You may configure the text of the related post secion header setting the `LACES_RELATED_POSTS_HEADER` variable. The default value is "Related posts:".

### Series

Configuration variable: `LACES_SERIES`
Configuration keys: `header`, `display_on_sidebar`, `display_on_footer`

This theme supports the [Series plugin](https://github.com/getpelican/pelican-plugins/tree/master/series).

If the plugin is enabled you may define the `display_on_footer` configuration key to display the links to the previous and next articles in the series in the footer of a post. You may customize the header of this list setting the `HEADER` configuration key, which can also include the `index` and `name` variables. The first is the index of the current article in the series (starting from 1) and the second is the name of the series. The default string is `Part %(index)s of the %(name)s series`.

You may display on the sidebar the link to the previous and next article in the series setting the `display_on_sidebar` configuration key to `True`.

You may display information on the series just under the article title setting the `series` field in `LACES_ARTICLE_INFO_PAGE`.

### IPython Notebook support

This theme supports including IPython notebooks through the [Liquid Tags plugin](https://github.com/getpelican/pelican-plugins/tree/master/liquid_tags). If you enable the plugin, the theme will automatically include the right CSS/JS to make the notebooks work.

### Favicon

Configuration variable: `LACES_FAVICON`

Set the `LACES_FAVICON` to the file containing your favicon. For example:

``` python
LACES_FAVICON = 'images/favicon.png'
```

### Article information

Configuration variables: `LACES_ARTICLE_INFO_LIST`, `LACES_ARTICLE_INFO_PAGE`
Configuration keys: `fields`
Available fields: `date`, `modified`, `series`, `author`, `category`, `tags`

You may show various article information just under the title through the `LACES_ARTICLE_INFO_LIST` and `LACES_ARTICLE_INFO_PAGE` variables. Both shall contain a `fields` key with the list of fields you want to show, but the former rules the appearance when articles are listed and the latter when the article page is shown.

Example:

To show date and tags of each post when listed but also show the series in the post page use this code:

``` python
LACES_ARTICLE_INFO_LIST = {
    'fields': ['date', 'tags']
}

LACES_ARTICLE_INFO_PAGE = {
    'fields': ['date', 'tags', 'series']
}
```

### Short menu labels for pages

By default, the title of a page is used both for showing the title as
part of a page's content, and, if pages in menu is enabled, as the
label of the corresponding menu item. You can choose a different label
for the menu (such as a short single word) than the page title by adding a
Menulabel metadata attribute to the page header (`Menulabel:` in
markdown, `:Menulabel:` in rst).

### About Me

Configuration variable: `LACES_ABOUT_ME`
Configuration keys: `text`, `avatar`, `header`

You can show a short blurb of text about yourself and a picture in the sidebar. If set, the picture pointed by the `avatar` key is shown at the top of the sidebar. Under it you will find a section with the content of the `text` key. The deafult header of the section is "About {{ AUTHOR }}" where `AUTHOR` is the Pelican configuration value. You can override it setting the `header` configuration key.

### Banner image

Configuration variable: `LACES_BANNER`
Configuration keys: `file`, `header`, `subtitle`, `all_pages`

A banner image can be added to the theme, displayed with an header and an optional subtitle. The banner image is set by the `file` configuration key and the subtitle by the `subtitle` one. The default header is the Pelican `SITENAME` variable and can be overridden setting the `header` configuration key.

If the `all_pages` flag is `True` the banner will be shown on every page of the blog, otherwise just on the pages containing the `banner` block (currently only `index.html`).


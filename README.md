# Laces3

Version: 1.3

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
THEME = "laces3"
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

### Navbar brand

Configuration variable: `LACES_NAVBAR_BRAND`

By default Laces3 shows the at the beginning of the navigation bar a link to the first page with the value of the `SITENAME` variable, but you can override this behaviour through the `LACES_NAVBAR_BRAND` variable.

You may provide a logo for your site through the `file` key, while the `width` value forces the width of the resulting `<img>` tag.

You can also provide an icon providing the Font Awesome icon name with the `icon` key. The text of the link is the content of the `title` key. If you want to use here the site name just initialize `title` with the `SITENAME` variable

Example of link with home icon and site name:

``` python
LACES_SITELOGO = {
    'title': SITENAME,
    'icon': 'home',
}
```

Example of link with just a custom 100px image

``` python
LACES_SITELOGO = {
    'file': 'images/my_site_logo.png',
    'width': 100,
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

### Archives

Configuration variable: `LACES_ARCHIVES`
Configuration keys: `url`, `text`

By default Laces3 shows the archives link to `/archives` with the `Archives` text. You may customize both values through the `url` and `text` keys of the `LACES_ARCHIVES` variable.

### Navbar

Configuration flag: `LACES_BOOTSTRAP_NAVBAR_INVERSE`

If you wish to use the inverse navbar from Bootstrap, set the flag `LACES_BOOTSTRAP_NAVBAR_INVERSE` to `True`.

### Related Posts

Configuration flag: `LACES_RELATED_POSTS_HEADER`

This theme has support for the [Related Posts plugin](https://github.com/getpelican/pelican-plugins/tree/master/related_posts). All you have to do, is enable the plugin, and the theme will do the rest.

You may configure the text of the related post secion header setting the `LACES_RELATED_POSTS_HEADER` variable. The default value is "Related posts:".

### Series

Configuration variable: `LACES_SERIES`
Configuration keys: `header`, `display_on_footer`

This theme supports the [series plugin](https://github.com/getpelican/pelican-plugins/tree/master/series).

If the plugin is enabled you may define the `display_on_footer` configuration key to display the links to the previous and next articles in the series in the footer of a post. You may customize the header of this list setting the `HEADER` configuration key, which can also include the `index` and `name` variables. The first is the index of the current article in the series (starting from 1) and the second is the name of the series. The default string is `Part %(index)s of the %(name)s series`.

You may display on the sidebar the link to the previous and next article in the series adding the `series` field to the `LACES_SIDEBAR` variable (see below).

You may display information on the series just under the article title setting the `series` field in `LACES_ARTICLE_INFO_PAGE`.

### IPython Notebook support

Configuration variable: `LACES_NOTEBOOK_MATH_CENTER`

This theme supports including IPython notebooks through the [Liquid Tags plugin](https://github.com/getpelican/pelican-plugins/tree/master/liquid_tags). If you enable the plugin, the theme will automatically include the right CSS/JS to make the notebooks work.

Set `LACES_NOTEBOOK_MATH_CENTER` to `True` to center math equations.

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

### Sidebar

Configuration variables: `LACES_SIDEBAR`
Configuration keys: `fields`, `recent`, `recent_num`
Available fields: `tags`, `tags_inline`, `categories`, `series`, `social`, `images`, `feeds`

If you want to show a sidebar just initialize the `LACES_SIDEBAR` variable. Its `fields` key may contain the following values:

* `tags` - Shows the tag cloud provided by the [tag_cloud](https://github.com/getpelican/pelican-plugins/tree/master/tag_cloud) plugin, which shall be enabled.
* `tags_inline` - This shows tags inline more as a proper tag cloud. You have to enable the `tags` field too.
* `categories` - Shows the site categories
* `series` - Shows the link to the next and the previous article in the same series (requires the [series plugin](https://github.com/getpelican/pelican-plugins/tree/master/series))
* `social` - Shows your social links using the Pelican `SOCIAL` variable. See below for a configuration example
* `images` - A list of images which will be shown in the sidebar (e.g. `images: ['/path/to/image1.png', '/path/to/image2.png']`)
* `feeds` - Shows feed links according to the `FEED_ALL_ATOM`, `TAG_FEED_ATOM` and `CATEGORY_FEED_ATOM` Pelican variables.

The `recent`, if set, shows a list of recent posts. The `recent_num` controls the amount of posts shown, if not set defaults to 5.

An example of social configuration is this (taken from pelican-bootstrap3)

```
SOCIAL = (('twitter', 'http://twitter.com/DaanDebie'),
          ('linkedin', 'http://www.linkedin.com/in/danieldebie'),
          ('github', 'http://github.com/DandyDev'),
          ('stackoverflow', 'http://stackoverflow.com/users/872397/dandydev', 'stack-overflow')
```

The first string in each item will be used for both the name as shown in the sidebar, and to determine the [FontAwesome](http://fontawesome.io/icons/)
icon to show. You can provide an alternative icon string as the third string (as shown in the last item with the `'stack-overflow'` icon name).

A complete example of sidebar configuration is the following

``` python
LACES_SIDEBAR = {
    'fields': ['tags', 'tags_inline', 'series', 'social'],
    'recent': True,
    'recent_num': 4
}
```

### reStructuredText styles

Configuration variables: `LACES_DOCUTILS_CSS`

If you're using reStructuredText for writing articles and pages, you can include the extra CSS styles that are used by the `docutils`-generated HTML by setting `LACES_DOCUTIL_CSS` to True. This can be done as a global setting or  setting it in the metadata of a specific article or page.

### Disqus comments

Configuration variables: `LACES_DISQUS`
Configuration keys: `no_id`, `recent`, `recent_num`

Disqus comments are enabled through the Pelican variable `DISQUS_SITENAME`.

This theme sets identifiers for each article's comment threads. If you are switching from a theme that doesn't (such as the Pelican built-in default) this will result in existing comments getting lost. To prevent this, set the `no_id` key to `True`.

Set the `id_prefix_slug` key to `True` if you have configured your article URLs such that the slug alone will likely not be unique. Ignored if `no_id` is `True`.

You can also enable Disqus comments for pages. This is a per-page setting you can control by adding a field `comments` to you pages' metadata. Set it to `enabled` to enable comments for that page. Comment-threads for pages will have an id that is prefixed by `page-`.

To show Disqus comment counts on the index page, set the `display_counts` key to `True`.

### Content license

Configuration variables: `LACES_LICENSE`
Configuration keys: `cc_short`, `cc_derivatives`, `cc_commercial`, `cc_attr_markup`, `custom`

You can declare a license for the content of your site. It will appear in the site's footer.

If you want to use a [Creative Commons license](http://creativecommons.org) you can set the `cc_short` key using the following abbreviated names:

* `'CC-BY'` (require attribution)
* `'CC-BY-SA'` (require ShareAlike)
* `'CC-BY-ND'` (NoDerivatives)
* `'CC-BY-NC'` (require attribution, no commercial reuse)
* `'CC-BY-NC-SA'` (require ShareAlike, no commercial reuse)
* `'CC-BY-NC-ND'` (NoDerivatives, no commercial reuse).

Alternatively, choose the licence by features setting the following keys:

* `cc_derivatives` - `'yes'` if permitted, `'no'` if not permitted, and `'ShareAlike'` if derivatives must be shared under the same terms
* `cc_commercial` - `'yes'` if commercial reuse is permitted, and `'no'` otherwise.

You can include attribution markup in the license mark by setting `cc_attr_markup` to `True`.

If you want to use another license type, you can instead set the `custom` key to a license string that will be showed at the bottom of every page. Raw HTML is allowed.

As `cc_*` keys take precedence, be sure to avoid them when setting `custom`.

For example, if you want to use the WTFPL license, you can set:

``` python
LACES_LICENSE = {
    'custom': 'Unless otherwise stated, all articles are published under the <a href="http://www.wtfpl.net/about/">WTFPL</a> license.'
}
```

### GitHub

Configuration variables: `LACES_GITHUB`
Configuration keys: `user`, `repo_count`, `skip_fork`, `show_user_link`

The theme can show your most recently active GitHub repos in the sidebar. To enable, set the a `LACES_GITHUB` variable and put your GitHub user into the `user` key.

Appearance and behaviour can be controlled using the following variables:

* `repo_count` - The number of repositories to show, defaults to 5
* `skip_fork` - Skip forked repositories, defaults to `True`
* `show_user_link` - Shows a link to the GitHub user page

### Facebook Open Graph

Configuration variables: `LACES_OPEN_GRAPH`
Configuration keys: `disable_meta`, `fb_app_id`, `image`

In order to make the Facebook like button and other social sharing options work better, the template contains Open Graph metatags like `<meta property="og:type" content="article"/>`. You can disable them by setting the `disable_meta` key to `False`.

You can use the `fb_app_id` key to provide a Facebook _app id_.

You can also provide a default image that will be passed as an Open Graph tag  by setting the `image` key to a relative file path, which will be prefixed by your site's base url. Optionally, you can override this default image on a per article and per page basis, by setting the `og_image` variable in an article or page.

### Twitter Cards and Timeline

Configuration variables: `LACES_TWITTER`
Configuration keys: `cards`, `widget_id`, `tweet_limit`

This theme supports [Summary Twitter Cards](https://dev.twitter.com/docs/cards/types/summary-card). To activate the necessary tags set the `cards` key of `LACES_TWITTER_CARDS` to `True`. Because Twitter Cards also use Open Graph tags to identify some of the necessary metadata, `LACES_OPEN_GRAPH` must not be disabled (it is enabled by default).

If you initialize the optional Pelican variable `TWITTER_USERNAME` it will be used to set the Twitter username for the site and for the content creator.

The same image options for Open Graph (see above) can be used for setting images that appear on Twitter Cards. So if you have set the `LACES_OPEN_GRAPH['image']` key and optionally `og_image` for articles and/or pages, you're good to go for Twitter Cards as well.

This theme can also show your twitter timeline in the sidebar. To enable, provide the Pelican `TWITTER_USERNAME` variable and put your Twitter Widget ID into the `LACES_TWITTER` variable with the `widget_id` key. You can limit the number of tweets shown by this widget setting the `tweet_limit` key to how many tweets you want to see.

To get a Twitter Widget ID go to: https://twitter.com/settings/widgets and select `Create new`. You'll find the ID under the html or in the site url: `https://twitter.com/settings/widgets/<TWITTER_WIDGET_ID>/edit`

### AddThis

Configuration variables: `LACES_ADDTHIS`
Configuration keys: `profile`, `addressbar`

You can enable sharing buttons through [AddThis](http://www.addthis.com/) by setting the `profile` key of the `LACES_ADDTHIS` variable to your AddThis profile-id. This will display a **Tweet**, **Facebook Like** and **Google +1** button under each post.

AddThis automatically adds a short hashtag to the end of your URLs. This lets you reveal how often visitors copy your URL from their address bar to share. Example of AddThis URL: `http://domain.com/page.html#UF0983`. This function can be disabled by setting the `addressbar` key to `False`.

All social buttons are enabled by default. You can disable them by setting the following keys to `False`: `facebook`, `twitter`, `googleplus`.

### Shariff

Configuration variables: `LACES_SHARIFF`
Configuration keys: `backend_url`, `lang`, `orientation`, `services`, `theme`, `twitter_via`

You may use [Shariff](https://github.com/heiseonline/shariff) by setting `LACES_SHARIFF = True`. This will display the privacy enabled social media buttons developed by [heiseonline](https://github.com/heiseonline).

By default, `data-url` is set to the URL of the current article.

To customize the social media buttons, set the following keys

* `backend_url` (see [Shariff Backends](https://github.com/heiseonline/shariff#backends))
* `lang` (`de` (default), `en` or `fr`)
* `orientation` (`horizontal` (default) or `vertical`)
* `services` (default: `[&quot;facebook&quot;,&quot;googleplus&quot;]`)
* `theme` (`standard` or `gray`)
* `twitter_via` (`True`/`False`, uses `TWITTER_USERNAME`)

For a detailed description of each setting, refer to [data attributes](https://github.com/heiseonline/shariff#options-data-attributes) description at the [Shariff README](https://github.com/heiseonline/shariff).

### Cookie Consent (EU Cookie Law)

Configuration variables: `LACES_COOKIECONSENT`
Configuration keys: `text`, `more_info_text`, `more_info_url`, `dismiss`, `dismiss_text`, `theme`

Since 2011 websites based in the EU are required to ask visitors for consent to use web cookies. This is especially relevant if you are using web analytics like Piwik or Google Analytics. This feature uses [Cookie Consent](https://github.com/silktide/cookieconsent2) by [Silktide](https://github.com/silktide).

If default values are good for you, you may enable the popup just setting

``` python
LACES_COOKIECONSENT = True
```

The text shown by the popup is the content of the `text` key and defaults to `'This website uses cookies to ensure you get the best experience on our website.'`

The link to get more information about the matter is by default `http://cookielawinfo.com/about/` with text `'More info'`. You may override both values through the `more_info_url` and `more_info_text` keys.

The dismiss button text defaults to `'Got it!'` and can be changes with the `dismiss_text` key.

Cookie Consent 2 can be themed, you can see available themes at https://silktide.com/tools/cookie-consent/download/. Theme names are in the form `(dark|light)-(bottom|floating|top)` (e.g. `dark-bottom` or `light-floating`). Put the theme name into the `theme` key, default is `dark-top`.

### Tipue Search

Configuration variables: `LACES_SEARCH_URL`

This theme has support for the
[Tipue Search plugin](https://github.com/getpelican/pelican-plugins/tree/master/tipue_search).

To use it enable the plugin, and the theme will add a search box on the right side of the menu. Then add `'search'` to the Pelican `DIRECT_TEMPLATES` variable in your `pelicanconf.py`. For example:

``` python
DIRECT_TEMPLATES = ('index', 'categories', 'authors', 'archives', 'search').
```

By default, the Tipue search page is configured at `/search.html`, but you can override that with the `LACES_SEARCH_URL` setting, which comes in handy if you have fancy rewrite rules in your Apache or Nginx configuration.

### Footer

The footer will display a copyright message using the AUTHOR variable and the year of the latest post. If a content license mark is enabled (see `LACES_LICENSE`), that will be shown as well.

## Live example

[This is my website](http://lgiordani.com)

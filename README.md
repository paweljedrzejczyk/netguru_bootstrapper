# NetguruBootstrapper

[![Gem Version](https://badge.fury.io/rb/netguru_bootstrapper.svg)](http://badge.fury.io/rb/netguru_bootstrapper)

This gem bootstraps [Bootstrap](http://getbootstrap.com/) for web apps.

## Table of Contents
1. [Installation](#installation)
2. [Usage](#usage)
3. [Files organization](#files-organization)
4. [Mixins](#mixins)
5. [Helpers](#helpers)
6. [Changelog](#changelog)
7. [Contributing](#contributing)

## Installation

Run:
```
gem install netguru_bootstrapper
```

Please note that this gem is designed to work with [Bootstrap for Sass](https://github.com/twbs/bootstrap-sass) gem, so you should add:
```
gem 'bootstrap-sass'
```
to your application's Gemfile as well. If you're not using Rails, add Bootstrap from different source that fits your application needs.

## Usage
```
$ netguru_bootstrapper install
```

### Configuration
+ `path` - set root directory path (`app/assets/stylesheets` by default)
+ `bootstrap-path` - set Bootstrap GEM/package path (`bootstrap` by default)

```
$ netguru_bootstrapper install --path "root/directory/path" --bootstrap-path "bootstrap"
```

#### Non-Rails frameworks
If you're not using Rails you'll probably need to edit [this line](https://github.com/netguru/netguru_bootstrapper/blob/master/lib/netguru_bootstrapper/templates/application.scss#L1). You can learn more about this at Bootstrap for Sass [wiki page](https://github.com/twbs/bootstrap-sass#installation).

## Files organization

### Tree structure
```
├── application.scss
├── components
│   └── _your-custom-components-go-here.scss
├── views
│   └── _your-view-based-styles-go-here.scss
├── framework
│   ├── _components.scss
│   ├── _overrides.scss
│   ├── _variables.scss
│   └── overrides
│       └── _framework-overrides-go-here.scss
├── settings
│   ├── _breakpoint-variables.scss
│   ├── _color-variables.scss
│   ├── _components-variables.scss
│   ├── _typography-variables.scss
│   ├── _views-variables.scss
│   └── _z-index-variables.scss
└── utilities
    ├── _functions.scss
    ├── _mixins.scss
    ├── _shared.scss
    └── _typography.scss
```

### Important files

#### <code>framework/_components.scss</code>
This file is a copy of [bootstrap.scss](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/_bootstrap.scss) file from [bootstrap-sass](https://github.com/twbs/bootstrap-sass) gem. You can comment out components that you're not going to use.

#### <code>framework/_variables.scss</code>
Copy of [bootstrap/variables.scss](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/bootstrap/_variables.scss). To override variable simply uncomment line and remove <code>!default</code> flag.

For example:
```scss
// $font-size-base: 14px !default;
```

Becomes:
```scss
$font-size-base: 16px;
```

#### <code>framework/_overrides.scss</code>

Similar to Boostrap Components - all overrides are commented out by default. After uncommenting an override you need to add proper file to <code>framework/overrides</code> directory.

## Mixins
This addon provides following useful mixins out of the box:

### `absolute`, `fixed`, `relative`
These mixins allows you to position an element with just one line of
code.

**Arguments**: List of positions in form of `[direction] [value]`, for example `top
10px`

**Usage**:
```scss
@include absolute(top 10px left 10px right 20px bottom 20px)
@include relative(top 10px left 10px right 20px bottom 20px)
@include fixed(top 10px left 10px right 20px bottom 20px)
```
### `sizing`
Allows you to declare sizing for an element in a `width height` format.

**Arguments**: List of dimensions, where the first element determines width and
the second height (in case of only one argument it gets set as width and height)

**Usage**:
```scss
/* will set width to 100px and height to 90px */
@include sizing(100px 90px)
/* will set width and height to 100px */
@include sizing(100px)
```
### `min-sizing`
The same as `sizing` but sets `min-width` and `min-height`.

**Arguments**: List of dimensions, where the first element determines width and
the second height (in case of only one argument it gets set as width and height)

**Usage**:
```scss
/* will set min-width to 100px and min-height to 90px */
@include min-sizing(100px 90px)
/* will set width and height to 100px */
@include min-sizing(100px)
```
### `max-sizing`
The same as `sizing` but sets `max-width` and `max-height`.

**Arguments**: List of dimensions, where the first element determines width and
the second height (in case of only one argument it gets set as width and height)

**Usage**:
```scss
/* will set max-width to 100px and max-height to 90px */
@include max-sizing(100px 90px)
/* will set max-width and max-height to 100px */
@include max-sizing(100px)
```
### `circle`
Forces the element to have certain dimensions and gives it a rounded border
effectively creating a circle.

**Arguments**: Element sizing, will set the `width` and `height` to the given
value.

**Usage:**
```scss
/* will set width and height to 50px and border radius to 50% */
@include circle(50px)
```

## Helpers
This addon provides following CSS helpers which are useful in some scenarios:

### `u-align-middle`, `u-align-top`, `u-align-bottom`
These helpers allows you to vertically position an element with just one CSS class.

**Usage**:
```html
<span class="u-align-middle"></span>
<span class="u-align-top"></span>
<span class="u-align-bottom"></span>
```

### `u-inline-block`, `u-block`, `u-inline`
These helpers allows you to change the display attribute of an element with just
one CSS class.

**Usage**:
```html
<p class="u-inline-block"></p>
<span class="u-block"></span>
<div class="u-inline"></div>
```

### `u-relative`
These helper allows you to change the position of an element to be relative with
just one CSS class.

**Usage**:
```html
<div class="u-relative"></div>
```

## [Changelog](https://github.com/netguru/netguru_bootstrapper/blob/master/CHANGELOG.md)
You can find changelog [here](https://github.com/netguru/netguru_bootstrapper/blob/master/CHANGELOG.md).

## Contributing

1. Fork it ( https://github.com/netguru/netguru_bootstrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

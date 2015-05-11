# NetguruBootstrapper

[![Gem Version](https://badge.fury.io/rb/netguru_bootstrapper.svg)](http://badge.fury.io/rb/netguru_bootstrapper)

This gem bootstraps [Bootstrap](http://getbootstrap.com/) for web apps.

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
│   ├── _z-index-variables.scss
│   ├── _breakpoint-variables.scss
│   └── _variables.scss
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

## [Changelog](https://github.com/netguru/netguru_bootstrapper/blob/master/CHANGELOG.md)
You can find changelog [here](https://github.com/netguru/netguru_bootstrapper/blob/master/CHANGELOG.md).


## Contributing

1. Fork it ( https://github.com/netguru/netguru_bootstrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

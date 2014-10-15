# NetguruBootstrapper

This gem bootstraps [Bootstrap](http://getbootstrap.com/) for Rails apps.

## Installation

Add this line to your application's Gemfile:
```
gem 'netguru_bootstrapper'
```

And then execute:
```
$ bundle
```

## Usage
```
$ rails g netguru_bootstrapper:bootstrap
```

## Files organization

### Tree structure
```
├── application.scss
├── components
│   └── _your-custom-components-go-here.scss
├── controllers
│   └── _your-controller-based-styles-go-here.scss
├── settings
│   ├── _bootstrap-components.scss
│   ├── _bootstrap-overrides.scss
│   ├── _bootstrap-variables.scss
│   ├── _custom-variables.scss
│   └── bootstrap-overrides
│       └── _bootstrap-overrides-go-here.scss
└── utilities
    ├── _functions.scss
    ├── _mixins.scss
    ├── _shared.scss
    └── _typography.scss
```

### Important files

#### <code>settings/bootstrap-components.scss</code>
This file is a copy of [bootstrap.scss](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/_bootstrap.scss) file from [bootstrap-sass](https://github.com/twbs/bootstrap-sass) gem. You can comment out components that you're not going to use.

#### <code>settings/bootstrap-variables.scss</code>
Copy of [bootstrap/variables.scss](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/bootstrap/_variables.scss). To override variable simply uncomment line and remove <code>!default</code> flag.

For example:
```scss
// $font-size-base: 14px !default;
```

Becomes:
```scss
$font-size-base: 16px;
```

#### <code>settings/bootstrap-overrides.scss</code>

Similar to Boostrap Components - all overrides are commented out by default. After uncommenting an override you need to add proper file to <code>settings/bootstrap-overrides</code> directory.


## Contributing

1. Fork it ( https://github.com/netguru/netguru_bootstrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# trySwiftApp
try! Swift Conference App

<a href="https://itunes.apple.com/us/app/try/id1083944488"><img src="Assets/app-store-badge.png" width="250" /></a>

## try! Swift Tokyo 2017 presentations
You can find an overview of speakers and their presentations, including slides and video [here](PRESENTATIONS.md). If you see slides or videos get posted, please create a [pull request][pr] to add these, or let us know by filing an [issue][issue].

<img src="https://cloud.githubusercontent.com/assets/4190298/23140345/534ae20c-f7b1-11e6-8584-b65aded1f59e.png" width=250>
<img src="https://cloud.githubusercontent.com/assets/4190298/23140344/53463e82-f7b1-11e6-8d84-c0cedcc930b1.png" width=250>

## Contributing
Check out the [issues][issue] and see how you can help out.

[pr]: https://github.com/tryswift/trySwiftAppFinal/pulls
[issue]: https://github.com/tryswift/trySwiftAppFinal/issues

# To build app

If you don't use [bundler](http://bundler.io/) now, install it to fix cocoapods version in this project.

```
$ gem install bundler
```

Then you install gems from Gemfile.

```
$ bundle install --path vendor/bundle
```

After you install cocoapods, do `pod install` via bundler:

```
$ bundle exec pod install
```

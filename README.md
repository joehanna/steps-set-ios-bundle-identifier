## Set iOS Info.plist - Bundle Identifier, Name and Display Name ([BITRISE](https://www.bitrise.io))

Sets the Bundle Identifier, Bundle Name and Bundle Display Name to specified values, in the target Info.plist file for the next build.

### How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

*Check the `bitrise.yml` file for required inputs which have to be
added to your `.bitrise.secrets.yml` file!*

*There is a sample Info.plist file in _tmp directory for your testing*

### Change log

Version 1.0.1
* Initial commit and first step share to Bitrise.

Version 1.0.2
* Fixed Info.plist file path input to allow space in file path.

Version 1.1.0
* Added setting of BundleName and BundleDisplayName

### Credits

Thanks to Bitrise team for this awesome service / prompt support!

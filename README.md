# ColorAutoGen 

ColorAutoGen is a swift code generator for iOS (Colors and UIColors) Swift Package.

ColorAutoGen create a Swift Package for your colors from a color xcassets.

Color xcassets -> Swift Package
# Installation
```
$ git clone https://github.com/leoparenti/ColorAutoGen.git
$ cd ColorAutoGen
$ make
```
# Usage
```
$ color-autogen --variable <variable> --source <SOURCE_PATH> --output <OUTPUT_PATH>
```
or
```
$ color-autogen -v <variable> -s <SOURCE_PATH> -o <OUTPUT_PATH>
```
for autogen Demo Package
```
$ color-autogen -v yourNamePackage -s Media.xcassets -o ../
```
yourNamePackage will generate YourNamePackage**Color** Package
# Options:
```
--variable: used for UIColor.<variable>.nameColor and package name '<Variable>Color'

--source: Path of the color xcassets
--output: Path of the output Package

All three options are required for the command to run. For more details use: color-autogen --help

```
# Autogen sample package:
[LibraryColor](https://github.com/leoparenti/ColorAutoGen/tree/develop/Generated/LibraryColor)


<img width="400" alt="Color" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/56f1bb46-043c-43eb-b9ff-6be5408b7129">
<img width="400" alt="UIColor" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/1aadc398-c4a5-48d8-8746-5f29414f0eb1">
<img width="400" alt="LibraryTests" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/bc8b2dc1-e37f-448b-a032-a502a7b7f55c">


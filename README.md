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

Add this in your (~/.zshrc if using zsh) or (~/.bash_profile if using bash):

```
# Generator aliases
alias autogen-test='color-autogen -n generated -a Media.xcassets -o ../'
```
# Usage
```
$ color-autogen -n <namevariable> -a <ASSET_PATH> -o <OUTPUT_PATH> -v <VERSION> -t <TYPE>
```
or
```
$ color-autogen --namevariable <variable> --a <ASSET_PATH> --output <OUTPUT_PATH> --version <VERSION> --type <TYPE>
```

for autogen Demo Package
```
$ color-autogen -n generated -a Media.xcassets -o ../
```
**generated** 
- Package name: Genereted**Color**
- variable to use in your Project (es. UIColor.variable.nameColor, Color.variable.nameColor)

# Options:
```
--namevariable:<mandatory>
        variable to use in your Project UIColor.<variable>.nameColor and package name '<Variable><Suffix>' (es: VariableColor)
--assetPath:<mandatory>
        Path of the colorxcassets
--output:<mandatory>
        Path of the output Package
--version:<optional>
        version to write in file of output Package (default no version)
--type:<optional>
    type of asset generator use (for now only color)

All three options are required for the command to run. For more details use: color-autogen --help

```
# Autogen sample package:
[LibraryColor](https://github.com/leoparenti/ColorAutoGen/tree/develop/Generated/LibraryColor)


<img width="400" alt="Color" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/56f1bb46-043c-43eb-b9ff-6be5408b7129">
<img width="400" alt="UIColor" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/1aadc398-c4a5-48d8-8746-5f29414f0eb1">
<img width="400" alt="LibraryTests" src="https://github.com/leoparenti/ColorAutoGen/assets/11173496/bc8b2dc1-e37f-448b-a032-a502a7b7f55c">


# ColorAutoGen

ColorAutoGen is a lightweight swift code generator for iOS (Colors and UIColors).
ColorAutoGen create a Swift Package for your colors from a color xcassets.

Installation
$ git clone https://github.com/leoparenti/ColorAutoGen.git
$ cd ColorAutoGen
$ make

Usage

$ color-autogen --v <variable> --source <source> --output <output>
Options:

--variable: used for UIColor.<variable>.nameColor and package name '<Variable>Color'
--source: Path of the color xcassets
--output: Path of the output Package
All three options are required for the command to run. For more details use: color-autogen --help


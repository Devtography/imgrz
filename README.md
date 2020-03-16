# imgrz

Swift based command line tool for batch resizing `JPEG` & `PNG` images.

## Installation

`imgrz` depends on package `SwiftGD`, which requires `GD` library to provide 
image resizing feature. `GD` library will have to be installed on your computer 
in order to use `imgrz`.

```sh
# macOS
brew tap devtography/utilities
brew install imgrz

# For Ubuntu users, install `GD` library via apt
apt install libgd-dev
# Clone the repository and compile from source
git clone https://github.com/Devtography/imgrz.git
cd imgrz
make install
```

## Usage

```
./imgrz <source> <destination> <size> [options]

Parameters:
  source        Path of source folder
  destination   Path of destinated output folder
  size          The maximum length of image width or height in px

Options:
  -f, --force   Overwrite existing file(s) in destination
  -h, --help    Show help information
  -r            Process images in sub-folders recursively
```

## Contributions

Contributions via pull requests are welcome and encouraged :)

## License

imgrz is licensed under the [Apache License, Version 2.0](LICENSE.md).

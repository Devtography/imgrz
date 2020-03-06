# imgrz

Swift based command line tool for batch resizing `JPEG` & `PNG` images.

## Installation

`imgrz` depends on package `SwiftGD`, which requires `GD` library to provide 
image resizing feature. `GD` library will have to be installed on your computer 
in order to use `imgrz`.

```sh
# For macOS users, use Homebrew to install GD library
brew install gd
# Download the mac executable of imgrz
curl https://github.com/Devtography/imgrz/releases/download/1.0.0/imgrz_mac -o imgrz

# For Linux users, install via apt
apt install libgd-dev
# Download the Linux executable of imgrz
curl https//github.com/Devtography/imgrz/releases/download/1.0.0/imgrz
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

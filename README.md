# get-marketing-version

A MacOS cammand line tool that prints the value of the 'CFBundleShortVersionString' key in the provided plist file."

## Usage

```
OVERVIEW: Prints the value of the 'CFBundleShortVersionString' key in the provided plist file.

USAGE: get-marketing-version <input-file>

ARGUMENTS:
  <input-file>            A plist file.

OPTIONS:
  -h, --help              Show help information.
  
```

## Requirements

Mac OS X 15 or greater.

## Installation

Clone the repo then run make install in the root of the repo directory:

```
$ make install
```

Or using swift itself:

```
$ swift build -c release
$ cp .build/release/get-marketing-version /usr/local/bin/get-marketing-version
```

> [!WARNING]
> These instructions assume you have permissions to wrote to `/usr/local/bin`.
![Mawkin Sans](title.png)

Mawkin Sans is a self-flipping font.

An example of text can be seen here:

![The last metroid is in captivity. The galaxy is at peace.](demo.png)

## Building

### Prerequisites

* have python3 and imagemagick installed (commands vary per OS)
* Install python scripts:
    * `pip3 install fontmake`
    * `pip3 install git+https://github.com/silnrsi/pysilfont`
    * `python3 -m pip install fonttools[ufo,lxml,woff,unicode]`

### Run builder

This will build the font and generate the title and demo.

```bash
./build.sh
```


![Mawkin Sans](title.png)

Mawkin Sans is a self-flipping font.

An example of text can be seen here:

![The last metroid is in captivity. The galaxy is at peace.](demo.png)

## Usage

Download the [latest version](https://github.com/raffitz/mawkin-sans/releases/latest) of the font.  For desktop use, you'll want to download the `mawkin_sans.otf` file and install it as a system font.  For use on a website, you'll want `mawkin_sans.woff2`, and the following CSS:

```css
@font-face {
  font-family: 'mawkin_sansregular';
  src: url('./mawkin_sans.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}
```

## Building

### Prerequisites

* have python3 and imagemagick installed (commands vary per OS)

### Run builder

This will build the font and generate the title and demo.

```bash
./build.sh
```


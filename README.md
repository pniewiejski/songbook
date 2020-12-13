# Songbook 🎶

A simple songbook created with LaTeX

## Motivation

I wanted to have my personalized songbook with all of my favorite campfire songs. 💁‍♂️

Also, I thought that it would be cool to make it so that a person who does not have any experience with LaTeX could add songs and build a PDF.
Thus, I needed a moderately simple solution - a few, easy to use, macros to describe things such as guitar chords etc. and a simple build process. Moreover, these qualities should allow for this project to be reusable.

To sum it all up, I'd like one of my favorite move characters to be able to use this project.

<img
    height="200"
    alt="Forrest Gump"
    src="./docs/assets/forrestgump.gif"
/>

Like any r̵e̵a̵s̵o̵n̵a̵b̵l̵e̵ _lazy_ person would do, before I actually started working on this repo I thought: _Hey! I should find something ready to use on GitHub_. Sadly, there was nothing which would work as I wanted. Still, there are some really good projects out there. I'd like to mention:
[tbabej/songbook](https://github.com/tbabej/songbook) and
[dhil/best-aalborg-songbook](https://github.com/dhil/best-aalborg-songbook).

## Adding songs and building 🛠

#### Prerequisites

If you want to build this project on your computer you'll need:

- Some **LaTeX** compiler. Install yourself one of the available distributions. I happen to use TeX
  Live. [https://www.latex-project.org/get/](https://www.latex-project.org/get/) is a good place to
  start. What's important is that you should have access to all packages used by this project.
- **Make**

### Songs

You should add your songs to the `songs` folder. There you can group them in subdirectories, for
instance:

```
├── link-songs.sh
├── songs
│   ├── 0_Folk
│   │   └── 01_Song_title.tex
│   │   └── 02_Song_title.tex
│   ├── 1_Ballads
│   │   └── 01_Song_title.tex
│   │   └── 02_Song_title.tex
│   └── index.tex
```

Notice the `index.tex` file. It is responsible for including your songs in the main document. **This
file is generated automatically by** `link-songs.sh`. Whenever you change contents of `songs/` you
should run that script. You can do it by running:

```
$ make link
```

Once you liked your songs you can build the project with:

```
$ make
```

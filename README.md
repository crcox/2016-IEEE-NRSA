ICML NRSA Paper
==============

Setup
-----
Once you pull this repository to your computer, you will probably have a
little more setup to do before it will work (at least, Tim probably will
since Urvashi and Rob have already been working on these tex files...).

I have tried to clean up the tex files and directory structure, and work
out a couple package incompatibilities etc. I had to install several
packages on my system before I could build the files. These packages
include:

- subfig
- algorithms
- fancyhdr
- natbib
- multirow
- soul
- hyperref (x)

I ultimately eliminated references to `hyperref` because I was unable to
get the document to build with this dependency included.

I created an archive that contains a full `texmf` directory structure
that contains all of these styles. This is untested, but you might just
be able to extract this archive in your home folder and then run
`texrehash` at the command line to install everything at once. I hope
that works. The procedure, starting in the repository, would be:

```
cp texmf.tgz ~/ && cd ~/
tar xzvf texmf.tgz
texrehash
```

If that does not work, the next easiest route to installing the
dependencies would be `tlmgr`, which is the package manager for TexLive.
The only caveat here is that you may or may not actually have this
installed. It did not use to come standard (although the version of
TexLive I installed on the latest Ubuntu this morning did come with it).
If you do have `tlmgr` you can install the packages with:

```
# If you have never used this app before, you will need to setup the
# directories before trying to install anything
tlmgr init-usertree
tlmgr install subfig --usermode --usertree "${HOME}/texmf"
```

In addition, the ICML .sty is required, and can be obtained here:
http://icml.cc/2016/wp-content/uploads/icml2016.tar.gz. If you
are using a linux system, you should either:

1. Extract this archive into ~/texmf/tex/latex
2. OR extract the archive anywhere and then copy or move all the files
   into this repository. I *think* that latex will look in the current
   directory for style files.

Both are "safe" in that they do not affect your system installation of
latex, but the first has the advantage (or disadvantage, I suppose) of
making the styles visible to all your projects.

Building the document
---------------------
You probably have an editor of choice that you can configure however you
like. For the sake of not cluttering the version control with temporary
and non-text files, it might be useful to tell your editor to place all
files created during the build process into a directory called `build`.
If you are building the document from the command line, the included
Makefile contains my `pdflatex` call which accomplishes this. Make sure
to create a directory named `build` before you try an build the document
with my Makefile. So, to compile the document, the following should
suffice.

```
mkdir build
make
```

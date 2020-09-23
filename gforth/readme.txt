Run gforth inside a container.

Example session

$ docker run -ti --rm mtrute/gforth-container
Gforth 0.7.9_20180905, Copyright (C) 1995-2017 Free Software Foundation, Inc.
Gforth comes with ABSOLUTELY NO WARRANTY; for details type `license'
Type `help' for basic help
words
disasm disline disass .... (lots of words)...
perform execute call noop  ok
bye
$

Use a directory mount to access files from a host directory (current work directory in the example) inside the container

$ cat $(pwd)/test.fs
.( huhu )
$ docker run -ti --rm -v$(pwd):/work mtrute/gforth-container
s" /work/test.fs" included huhu ok
bye
$

Use the current user id (or any other numeric id) inside the container

$ id -u
1001
$ docker run -ti --rm --user $(id -u) mtrute/gforth-container
s" id -u" system uid=1001
 ok
bye
$

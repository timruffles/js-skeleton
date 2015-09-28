# make JFLAGS="--pretty --noinline"
JFLAGS =

# Let ocamlbuild work out the dependencies.
.PHONE: build-byte

build/main.js: build-byte
	js_of_ocaml ${JFLAGS} +weak.js build/main.byte

build-byte:
	ocamlbuild -cflag -g -no-links -use-ocamlfind main.byte

clean:
	ocamlbuild -clean

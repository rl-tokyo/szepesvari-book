#!/bin/sh -e

if [ "$1" = "--use-docker" ]; then
	echo "compiling using sotetsuk/platex ..."
	docker run --rm -v `pwd`:/latex sotetsuk/platex platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	# docker run --rm -v `pwd`:/latex sotetsuk/platex bibtex main
	docker run --rm -v `pwd`:/latex sotetsuk/platex platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	docker run --rm -v `pwd`:/latex sotetsuk/platex platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	docker run --rm -v `pwd`:/latex sotetsuk/platex dvipdfmx main
else
       	echo "compiling using local platex ..."
	platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	# bibtex main
	platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	platex -interaction=nonstopmode -halt-on-error -shell-escape -kanji=utf8 main
	dvipdfmx main
fi

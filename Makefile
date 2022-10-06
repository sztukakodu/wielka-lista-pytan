all: require build push

require:
	@which markdown-toc >/dev/null 2>&1 || (echo "ERROR: markdown-toc is required."; exit 1)
	@which pandoc >/dev/null 2>&1 || (echo "ERROR: pandoc is required."; exit 1) 

build:
	markdown-toc questions.md > toc.md
	pandoc -s toc.md questions.md --template template.md -o README.md
	rm toc.md

push:
	git commit -a -m "Update questions list $(date)"
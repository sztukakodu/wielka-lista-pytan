build:
	pandoc -f gfm -s --template template.md --toc questions.md -o README.md

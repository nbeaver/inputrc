RST  :=$(wildcard *.rst)
HTML :=$(patsubst %.rst,%.html, $(RST))

.PHONY : all
all: $(HTML)

%.html: %.rst
	rst2html --exit-status=2 $< $@ || touch --no-create --date=@1 $@

.PHONY : clean
clean:
	rm -f -- $(HTML)

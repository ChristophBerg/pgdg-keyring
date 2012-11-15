KEYRING = apt.postgresql.org.gpg

all: $(KEYRING)

%.gpg: %.asc
	gpg --no-default-keyring --keyring ./$@ --import $<
	gpg --no-default-keyring --keyring ./$@ --list-keys

install:
	mkdir -p $(DESTDIR)/etc/apt/trusted.gpg.d/
	install -m644 $(KEYRING) $(DESTDIR)/etc/apt/trusted.gpg.d/

clean:
	rm -f $(KEYRING)*

## Process this file with automake to produce Makefile.in

dist_man_MANS = \
	start-stop-parsec-daemon.8

LINGUAS = ru

install-data-local:
	for lang in $(LINGUAS); do \
		files=""; \
		for trans in $(dist_man_MANS); do \
			if [ -f $(CURDIR)/$$lang/$$trans ]; then \
				files="$$files $(CURDIR)/$$lang/$$trans"; \
			elif [ -f $(srcdir)/$$lang/$$trans ]; then \
				files="$$files $(srcdir)/$$lang/$$trans"; \
			fi; \
		done; \
		$(MAKE) install-man \
			mandir="$(mandir)/$$lang" \
			man_MANS="" \
			dist_man_MANS="$$files"; \
	done

uninstall-local:
	for lang in $(LINGUAS); do \
		files=""; \
		for trans in $(dist_man_MANS); do \
			if [ -f $(CURDIR)/$$lang/$$trans ]; then \
				files="$$files $(CURDIR)/$$lang/$$trans"; \
			elif [ -f $(srcdir)/$$lang/$$trans ]; then \
				files="$$files $(srcdir)/$$lang/$$trans"; \
			fi; \
		done; \
		$(MAKE) uninstall-man \
			mandir="$(mandir)/$$lang" \
			man_MANS="" \
			dist_man_MANS="$$files"; \
	done

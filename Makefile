# Makefile for Sphinx documentation

# Special Make configuration:
# - Run all targets sequentially (disable parallel jobs)
#   See: https://www.gnu.org/software/make/manual/html_node/Parallel.html
# - Run all commands in the same shell (disable one shell per command)
#   See: https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.NOTPARALLEL:
.ONESHELL:
.PHONY: help init-workdir Makefile*

# Check required features
ifeq ($(filter oneshell,$(.FEATURES)),)
$(error This Make doesn't support '.ONESHELL', use Make >= 3.82)
endif

# You can set these variables from the command line.
SPHINXOPTS  :=
SPHINXBUILD := sphinx-build
SPHINXPROJ  := FIWARE-Kurento
SOURCEDIR   := doc
BUILDDIR    := build
WORKDIR     := $(CURDIR)/$(BUILDDIR)/$(SOURCEDIR)
HTMLDIR     := $(BUILDDIR)/html

# Get the version number
VERSION := $(strip $(shell cat VERSION))
# FIXME: '.SHELLSTATUS' requires Make >= 4.2 (Xenial has 4.1)
# ifneq ($(.SHELLSTATUS),0)
# $(error Cannot read 'VERSION', make sure it exists)
# endif

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo "  langdoc     to make JavaDocs and JsDocs of the Kurento Clients"
	@echo "  dist        to make <langdoc html epub latexpdf> and then pack"
	@echo "              all resulting files as kurento-doc-$(VERSION).tgz"
	@echo "  readthedocs to make <langdoc> and then copy the results to the"
	@echo "              Sphinx theme's static folder"
	@echo ""
	@echo "apt-get dependencies:"
	@echo "- make >= 3.82"
	@echo "- javadoc (default-jdk-headless)"
	@echo "- npm"
	@echo "- latexmk"
	@echo "- texlive-fonts-recommended"
	@echo "- texlive-latex-recommended"
	@echo "- texlive-latex-extra"
	@echo ""
	@echo "python pip dependencies:"
	@echo "- sphinx >= 1.5.0 (Tested: 1.6.6)"
	@echo "- sphinx_rtd_theme"


# Comment this target to disable generation of JavaDoc & JsDoc
#html: langdoc

html:
	rm -R $(HTMLDIR)
	mkdir $(HTMLDIR)
	$(SPHINXBUILD) -c . $(SPHINXOPTS) $(SOURCEDIR) $(HTMLDIR)

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
SOURCEDIR   := .
BUILDDIR    := build
WORKDIR     := $(CURDIR)/$(BUILDDIR)/
HTMLDIR     := $(BUILDDIR)/html

# Get the version number
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

	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|DOC_VERSION|@$(DOC_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|KMS_VERSION|@$(KMS_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|CLIENT_JAVA_VERSION|@$(CLIENT_JAVA_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|CLIENT_JS_VERSION|@$(CLIENT_JS_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|UTILS_JS_VERSION|@$(UTILS_JS_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|TUTORIAL_JAVA_VERSION|@$(TUTORIAL_JAVA_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|TUTORIAL_JS_VERSION|@$(TUTORIAL_JS_VERSION)@" {} \;
	find $(HTMLDIR) -name "*.html" -exec sed -i -e "s@|TUTORIAL_NODE_VERSION|@$(TUTORIAL_NODE_VERSION)@" {} \;
	@echo
	@echo "Build finished. The HTML pages are in $(HTMLDIR)."

langdoc:
	echo "#### 'langdoc' target BEGIN ####"

	# Care must be taken because the Current Directory changes in this target,
	# so it's better to use absolute paths for destination dirs.
	# The 'client-doc' part must match the setting 'html_static_path' in 'conf.py',
	# and its contents must match the URLs used in the documentation files.
	$(eval WORKPATH := $(CURDIR)/$(BUILDDIR)/kurento-orion-src)
	$(eval DESTPATH := $(CURDIR)/$(BUILDDIR)/langdoc)
	rm -Rf $(WORKPATH)
	mkdir -p $(WORKPATH)
	mkdir -p $(DESTPATH)

	# kurento-client javadoc
	cd $(WORKPATH)
	git clone https://github.com/Kurento/kurento-fiware-java.git 
	echo "Using master branch"
	cd kurento-fiware-java/kurento-fiware || { echo "ERROR: 'cd' failed, ls:"; ls -lA; rm -Rf $(WORKPATH); exit 1; }
	mvn --batch-mode --quiet clean package \
		-DskipTests || { echo "ERROR: 'mvn clean' failed"; rm -Rf $(WORKPATH); exit 1; }
	mvn --batch-mode --quiet javadoc:javadoc \
		-DreportOutputDirectory="$(DESTPATH)" -DdestDir="kurento-orion" \
		-Dsourcepath="src/main/java:target/generated-sources/kurento-orion" \
		-Dsubpackages="org.kurento.orion" -DexcludePackageNames="*.internal" \
		|| { echo "ERROR: 'mvn javadoc' failed"; rm -Rf $(WORKPATH); exit 1; }
	rm -Rf $(WORKPATH) || { echo "ERROR: 'mvn clean' failed"; exit 1; }
	echo "#### 'langdoc' target END ####"

all: langdoc html

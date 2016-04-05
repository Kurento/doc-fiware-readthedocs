# -*- coding: utf-8 -*-
#
# on_rtd is whether we are on readthedocs.org
import os
on_rtd = os.environ.get('READTHEDOCS', None) == 'True'

if not on_rtd:  # only import and set the theme if we're building docs locally
    html_theme_path = ['themes']
    html_theme = 'sphinx_rtd_theme'

# otherwise, readthedocs.org uses their theme by default, so no need to specify it

# Using downloaded sphinx_rtd_theme
# import sphinx_rtd_theme
# html_theme = "sphinx_rtd_theme"
# html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

project = 'FIWARE-Stream-Oriented-GE'

html_context = {
   'css_files': [
      '_static/css/theme.css',
      'https://fiware.org/style/fiware_readthedocs.css'
   ]
}

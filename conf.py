# -*- coding: utf-8 -*-
#
# on_rtd is whether we are on readthedocs.org
import os
on_rtd = os.environ.get('READTHEDOCS', None) == 'True'

if not on_rtd:  # only import and set the theme if we're building docs locally
    html_theme_path = ['themes']
    html_theme = 'sphinx_rtd_theme'

# otherwise, readthedocs.org uses their theme by default, so no need to specify it

project = 'FIWARE-Stream-Oriented-GE'

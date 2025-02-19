###################################################################
# Ranger default_mod colorscheme
###################################################################

from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import (
	black, blue, cyan, green, magenta, red, white, yellow, default,
	normal, bold, reverse, dim, BRIGHT, default_colors,
	)

class Scheme(Default):
	# XTerm color number 240 equals HEX color #585858
	border_color_mod = 240

	def use(self, context):
		fg, bg, attr = Default.use(self, context)

		if context.border:
			fg = self.border_color_mod

		return fg, bg, attr

# Copyright (c) 2015 Motonori IWAMURO
#
# This software is released under the MIT License.
# http://opensource.org/licenses/MIT

default['base_packages']['group']['install'] = [
  'Development tools'
]

default['base_packages']['group']['uninstall'] = [
]

default['base_packages']['install'] = %w[
  man-pages
  man-pages-overrides
]

default['base_packages']['uninstall'] = %w[
]

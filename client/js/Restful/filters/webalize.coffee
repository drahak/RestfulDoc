goog.provide 'Restful.webalize'

goog.require 'Restful'

nodiac = { 'á': 'a', 'č': 'c', 'ď': 'd', 'é': 'e', 'ě': 'e', 'í': 'i', 'ň': 'n', 'ó': 'o', 'ř': 'r', 'š': 's', 'ť': 't', 'ú': 'u', 'ů': 'u', 'ý': 'y', 'ž': 'z' }

###*
 * Webalize filter
 * @copyright Jakub Vrána, http://php.vrana.cz/vytvoreni-pratelskeho-url.php
###
Restful.webalize = (s) ->
  s = s.toLowerCase()
  s2 = ''
  for c in s
    if typeof nodiac[c] != 'undefined'
      s2 += nodiac[c]
    else
      s2 += c
  s2.replace(/[^a-z0-9_]+/g, '-').replace(/^-|-$/g, '');


Restful.module.filter 'webalize', -> Restful.webalize
goog.require 'App'
goog.require 'App.webalize'

describe 'Webalize filter', ->
  filter = null
  beforeEach module 'App'
  beforeEach inject ($filter) ->
    filter = $filter 'webalize'

  it 'webalize spaces', ->
    result = filter ' some might say '
    expect(result).toBe 'some-might-say'

  it 'webalzie accets', ->
    result = filter 'ěščřžýáíé'
    expect(result).toBe 'escrzyaie'

  it 'makes string lowercase and webalize special characters', ->
    result = filter '*Hello World!?*'
    expect(result).toBe 'hello-world'
describe 'Library page view', ->

  beforeEach ->
    browser().navigateTo '/sandbox/client/libraries'

  it 'filters library list', ->
    expect(repeater('#libraries li').count()).toBe 6

    input('search').enter 'language'

    expect(repeater('#libraries li').count()).toBe 1
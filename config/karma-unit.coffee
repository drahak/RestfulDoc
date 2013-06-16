@basePath = '../'

@frameworks = ['jasmine']

@files = [
  {pattern: 'client/libs/closure-library/closure/goog/base.js', watched: false, included: true, served: true}
  {pattern: 'client/libs/closure-library/closure/goog/deps.js', watched: false, included: true, served: true}
  {pattern: 'client/libs/angular/angular.js', included: true}
  {pattern: 'client/libs/angular-mocks/angular-mocks.js', included: true}
  {pattern: 'client/build/deps.js', watched: true, included: true, served: true}
  {pattern: 'client/js/**/*.js', watched: true, included: false, served: true}
  {pattern: 'tests/unit/**/*Spec.js', watched: true, included: true, served: true}
]

@plugins = [
  'karma-jasmine'
  'karma-chrome-launcher'
  # 'karma-firefox-launcher' # uncomment if you want to run text in firefox. Run command: npm i karma-firefox-launcher
]

@autoWatch = true

@browsers = ['Chrome']
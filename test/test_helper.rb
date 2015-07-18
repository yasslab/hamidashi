require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'hamidashi'

HAMIDASHI_TEST_PDF = File.expand_path('fixtures/hamidashi.pdf', __dir__)

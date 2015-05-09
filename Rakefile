require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << 'gems'
  t.test_files = FileList['test/**/**/test_*.rb']
  t.verbose = true
end

task :console do
  require 'irb'
  require 'irb/completion'

  $LOAD_PATH.unshift(File.dirname(__FILE__))
  $LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

  ARGV.clear
  IRB.start
end
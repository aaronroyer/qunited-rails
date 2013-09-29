require 'qunited/rake_task'

desc 'Run tests on application JavaScript file'
task 'test:js:application' => :environment do
  QUnited::RakeTask.new('qunited') do |t|
    all_js_file = './tmp/qunited-application.js'
    File.open(all_js_file, 'w') do |f|
      f.write(Rails.application.assets.find_asset('application').to_s)
    end
    t.source_files = [all_js_file]
    t.test_files_pattern = ['./test/javascripts/*_test.js']
  end

  Rake::Task['qunited'].invoke
end

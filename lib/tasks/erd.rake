# It's necessary to check the existence of 'erd' task due to a bug in 'assets:precompile' task!
if Rake::Task.task_defined? 'erd'
  Rake::Task['erd'].enhance do
    require 'fileutils'

    FileUtils.mkdir('doc') unless File.directory?('doc')

    #the "erd" file name format is: erd_{current datetime}_{current schema version}
    FileUtils.mv('erd.pdf',
                 "doc/erd_#{Time.now.strftime('%Y%m%d%H%M%S')}_#{ActiveRecord::Migrator.current_version}.pdf")

    puts "erd.pdf was moved to doc/."
  end
end
namespace :loadat do
  desc "Load data in <directory>/*.dat into MySQL database"
	task :dir, :asdf  => :environment do |task, args|
    total_size = 0
		dir = args[:directory] ? [args[:directory]] : [Rails.root, "tmp"]  
		files = (dir + ["*.dat"]).flatten
    Dir.glob(File.join(files)) do |file|
      table_name = File.basename(file, ".dat")
      quoted_table_name = quote_table_name(table_name)
      file_size = File.size(file)
      total_size += file_size
      if file_size > 0
        progress("Loading #{file_size} byte data into #{table_name}")
        #execute("ALTER TABLE #{quoted_table_name} ENGINE = MyISAM")
        #execute("TRUNCATE TABLE #{quoted_table_name}")
        #execute("ALTER TABLE #{quoted_table_name} DISABLE KEYS")
        #execute("LOAD DATA LOCAL INFILE '#{file}' INTO TABLE #{quoted_table_name}")
        progress("adding index to #{quoted_table_name}")
        #execute("ALTER TABLE #{quoted_table_name} ENABLE KEYS")
      end
    end
    puts "[#{Time.now.to_s}] #{total_size} byte data loaded"
  end

  def progress(message)
    puts "[#{Time.now.to_s}] #{message}"
  end

  def execute(sql)
    ActiveRecord::Base.connection.execute(sql)
  end

  def quote_table_name(table_name)
    ActiveRecord::Base.connection.quote_table_name(table_name)
  end
end

task :clean do
  `rm -rf target` if(File.exists?('target'))
end

task :build do
  if(Dir.glob('jcoffee*').empty?)
    `wget https://github.com/downloads/yeungda/jcoffeescript/jcoffeescript-1.0.jar --no-check-certificate`
  end
  `mkdir -p target/hashed`
  Dir.glob('target/**/*.js').each{|x|File.delete(x)}
  Dir.glob("**/*.coffee").each do |path|
    hash = `shasum #{path}`.split[0]
    unless(File.exists?('target/hashed/'+hash))
      puts "Building #{path}..."
      `java -jar jcoffeescript-1.0.jar --bare < #{path} > target/hashed/#{hash}`
    end
    js = path.sub(/\.coffee$/,'.js').sub(/^src\//,'')
    path = path
    if(path =~ /^(src\/)?(.*)\/[^\/]+\.coffee$/)
      `mkdir -p target/#{$2}`
    end
    Dir.chdir('target') do
      File.symlink(File.absolute_path('hashed/'+hash), js)
    end
  end
end

task :test => :build do
  `google-chrome test.html`
end

task :default => :build

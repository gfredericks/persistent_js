task :clean do
  `rm -rf target` if(File.exists?('target'))
end

task :prepare_tmp do
  `mkdir -p tmp/js_cache`
end

task :ensure_jcoffeescript => :prepare_tmp do
  Dir.chdir 'tmp' do
    if(Dir.glob('jcoffee*').empty?)
      `wget https://github.com/downloads/yeungda/jcoffeescript/jcoffeescript-1.0.jar --no-check-certificate`
    end
  end
end

task :build => [:clean, :ensure_jcoffeescript] do
  `mkdir -p target`
  Dir.glob("**/*.coffee").each do |path|
    hash = `shasum #{path}`.split[0]
    unless(File.exists?('tmp/js_cache/'+hash))
      puts "Building #{path}..."
      `java -jar tmp/jcoffeescript-1.0.jar --bare < #{path} > tmp/js_cache/#{hash}`
    end
    js = path.sub(/\.coffee$/,'.js').sub(/^src\//,'')
    if(path =~ /^(src\/)?(.*)\/[^\/]+\.coffee$/)
      `mkdir -p target/#{$2}`
    end
    File.link(File.absolute_path('tmp/js_cache/'+hash), 'target/' + js)
  end
end

task :test => :build do
  `google-chrome test.html`
end

task :default => :build

task :build do
  if(Dir.glob('jcoffee*').empty?)
    `wget https://github.com/downloads/yeungda/jcoffeescript/jcoffeescript-1.0.jar --no-check-certificate`
  end
  `mkdir -p target`
  `rm -rf target/*`
  Dir.glob("**/*.coffee").each do |path|
    path = path
    if(path =~ /^(src\/)?(.*)\/[^\/]+\.coffee$/)
      `mkdir -p target/#{$2}`
    end
    puts "Building #{path}..."
    js = path.sub(/\.coffee$/,'.js').sub(/^src\//,'')
    `java -jar jcoffeescript-1.0.jar --bare < #{path} > target/#{js}`
  end
end

task :test => :build do
  `google-chrome test.html`
end

task :default => :build

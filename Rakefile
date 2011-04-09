task :build do
  `mkdir -p target`
  `rm -rf target/*`
  Dir.glob("**/*.coffee").each do |path|
    path = path
    if(path =~ /^(src\/)?(.*)\/[^\/]+\.coffee$/)
      `mkdir -p target/#{$2}`
    end
    puts "Building #{path}..."
    js = path.sub(/\.coffee$/,'.js').sub(/^src\//,'')
    `cat #{path} | java -jar jcoffeescript-1.0.jar > target/#{js}`
  end
end

task :test => :build do
  `google-chrome test.html`
end

task :default => :build

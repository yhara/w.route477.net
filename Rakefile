#require 'middleman-gh-pages'

desc "build"
task :build do
  sh "middleman build"
end

desc "scp to server"
task :publish => :build do
  sh "rsync -avr --progress build/* sakura:public_html/w/"
end

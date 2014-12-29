# coding: utf-8

require 'rake'
require 'yaml'
require 'fileutils'

DOTDIR = File.dirname(__FILE__)

Dir.chdir(DOTDIR)

# load configure files from sub directory
Dir.glob('*/config.yml').each do |name|
  dname = name.split('/')[0]
  config = YAML.load_file(name)

  namespace dname do
    [:install, :update].each do |atask|
      task atask do
        (config[atask.to_s] || []).each do |method, value|
          value.compact.each do |v|
            Dir.chdir(dname) do
              Kernel.send(method, v)
            end
          end
        end
      end
    end
  end
end

task :default => [:help]

desc 'install dotfiles to user\'s home directory'
task :install do
  Rake.application.tasks.each do |task|
    if task.name.end_with?(":install")
      puts "\e[34m * invoke #{task.name}\e[0m"
      task.invoke
    end
  end
end

desc 'update dotfiles'
task :update do
  Rake.application.tasks.each do |task|
    if task.name.end_with?(':update')
      puts "\e[34m * invoke #{task.name}\e[0m"
      task.invoke
    end
  end
end

desc 'print help'
task :help do
  puts <<-EOS
dotfiles management script.
usage:
  rake install --- install dotfiles.
  rake update  --- update dotfiles.
EOS
end

def link(args)
  src, dst = ["src", "dst"].map {|v| File.expand_path(args[v])}
  puts "    * linking #{src} -> #{dst}"
  FileUtils.symlink(src, dst, {:force => true})
end

def exec(args)
  command = args
  puts "    * executing `#{command}'"
  system(command)
end

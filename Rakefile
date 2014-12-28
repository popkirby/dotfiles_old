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
    task :install do
      links = config['install']['link'] if config['install'] != nil
      links.each do |v|
        Dir.chdir(dname) do
          src = File.expand_path(v['src'])
          dst = File.expand_path(v['dst'])
          puts "    * linking #{src} -> #{dst}"
          FileUtils.symlink(src, dst, {:force => true})
        end
      end if links != nil

      execs = config['install']['exec'] if config['install'] != nil
      execs.each do |v|
        Dir.chdir(dname) do
          puts "    * executing `#{v}'"
          system(v)
        end
      end if execs != nil
    end

    task :update do
      execs = config['update']['exec'] if config['update'] != nil
      execs.each do |v|
        Dir.chdir(dname) do
          puts "    * executing `#{v}'"
          system(v)
        end
      end if execs != nil
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


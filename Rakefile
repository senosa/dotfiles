# -*- coding: utf-8 -*-
require 'pathname'

task 'default' => ['show', 'unlink', 'symlink']

HOME = Pathname.new(ENV['HOME'])
IGNORED_DOTFILES = ['.git', '.gitmodules', '.DS_Store']
DOTFILES_SRCS = FileList['.[^.]*'].exclude(*IGNORED_DOTFILES)

dotfiles =[]
DOTFILES_SRCS.each do |file|
  dotfiles << Pathname.new("#{file}")
end

desc '処理対象のファイルを表示'
task 'show' do
  dotfiles.each do |file|
    puts file.expand_path
  end
end

desc 'symlinkを消す'
task 'unlink' do
  dotfiles.each do |file|
    if HOME.expand_path.join(file.basename).exist?
      HOME.expand_path.join(file.basename).unlink
      puts "delete link #{file.basename}"
    else
      puts "#{file.basename} non-exist"
    end
  end
end

desc 'symlinkを作る'
task 'symlink' do
  dotfiles.each do |file|
    if HOME.expand_path.join(file.basename).exist?
      puts "#{file.basename} already exist"
    else
      HOME.expand_path.join(file.basename).make_symlink(file.expand_path)
      puts "make link #{file.basename}"
    end
  end
end

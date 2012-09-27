# encoding: utf-8
require 'open-uri'
require 'json'
namespace :db  do
  desc "Task description"
  task :seed_data => :environment do
    p 'deleting all mangas and chapters...'
    # Manga.delete_all
    # Chapter.delete_all
    file1 = File.open('db/mangas.json')
    mangas = ActiveSupport::JSON.decode(file1)
    mangas_size = mangas.count
    p 'importing mangas...'
    mangas.each_with_index do |manga, index|
      print "#{index}\r"
      Manga.create(manga)
    end
    p 'importing chapters...'
    file2 = File.open('db/chapters.json')
    chapters = ActiveSupport::JSON.decode(file2)
    chapters_size = chapters.count
    chapters.each_with_index do |chapter, index|
      print "#{index}\r"
      Chapter.create(chapter)
    end
    p 'Mangas imported.'
  end

  desc "Task description"
  task :fix_db => :environment do

    Chapter.each do |c|
      c.manga_id = ""
      c.save
      if c.photo_album_name
        m = Manga.where(photo_album_name: c.photo_album_name[0..-6].downcase).first
        m.chapters << c if m
      end
    end
  end
end

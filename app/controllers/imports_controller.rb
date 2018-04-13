class ImportsController < ApplicationController

  # POST /import_files
  def import_files
    logger_level_backup = ActiveRecord::Base.logger.level
    ActiveRecord::Base.logger.level = :error
    idx = 0
    records = []
    if params[:menu]
      SmarterCSV.process(params[:menu].tempfile, {:chunk_size => 20000}) do |chunk|
        records = []
        chunk.each do |row|
          records << Menu.new(row)
        end
        Menu.import(records, on_duplicate_key_ignore: true, validate: false)
      end
    elsif params[:dish]
      SmarterCSV.process(params[:dish].tempfile, {:chunk_size => 20000}) do |chunk|
        records = []
        chunk.each do |row|
          records << Dish.new(row)
        end
        Dish.import(records, on_duplicate_key_ignore: true, validate: false)
      end
    elsif params[:menu_page]
      SmarterCSV.process(params[:menu_page].tempfile, {:chunk_size => 20000}) do |chunk|
        records = []
        chunk.each do |row|
          records << MenuPage.new(row)
        end
        MenuPage.import(records, on_duplicate_key_ignore: true, validate: false)
      end
    elsif params[:menu_item]
      SmarterCSV.process(params[:menu_item].tempfile, {:chunk_size => 20000}) do |chunk|
        records = []
        chunk.each do |row|
          records << MenuItem.new(row)
        end
        MenuItem.import(records, on_duplicate_key_ignore: true, validate: false)
      end
    end

    head :ok
  rescue => e
    logger.error e.message
  ensure
    ActiveRecord::Base.logger.level = logger_level_backup
  end


  # GET /imports
  def index
    
  end
end

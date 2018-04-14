# frozen_string_literal: true

class ImportsController < ApplicationController
  include CSVImporter

  # POST /import_files
  def import_files
    logger_level_backup = ActiveRecord::Base.logger.level
    ActiveRecord::Base.logger.level = :error

    if params[:menu]
      CSVImporter.process(params[:menu].tempfile, "Menu")
    elsif params[:dish]
      CSVImporter.process(params[:dish].tempfile, "Dish")
    elsif params[:menu_page]
      CSVImporter.process(params[:menu_page].tempfile, "MenuPage")
    elsif params[:menu_item]
      CSVImporter.process(params[:menu_item].tempfile, "MenuItem")
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

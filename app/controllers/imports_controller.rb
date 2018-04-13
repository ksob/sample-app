class ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]

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
  # GET /imports.json
  def index
    
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports
  # POST /imports.json
  def create
    @import = Import.new(import_params)

    respond_to do |format|
      if @import.save
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.fetch(:import, {})
    end
end

class ExportsController < ApplicationController

  # GET /exports
  def index
    @places = Menu.pluck(:place).map{ |place| place.upcase if place }.uniq
  end

  # GET /send_export.json
  def send_export
    export_params = params[:export_params]
    from_date = Date.new export_params["from_date(1i)"].to_i, 
        export_params["from_date(2i)"].to_i, export_params["from_date(3i)"].to_i
    to_date = Date.new export_params["to_date(1i)"].to_i, 
        export_params["to_date(2i)"].to_i, export_params["to_date(3i)"].to_i

    @menus = Menu.by_place_and_date(export_params[:place], from_date, to_date)

    respond_to do |format|
      format.json { send_data @menus.to_json, type: :json, disposition: "attachment", 
        filename: "your_export.json", status: :ok }
    end
  end

end

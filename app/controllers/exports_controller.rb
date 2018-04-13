class ExportsController < ApplicationController

  # GET /exports
  def index
    @places = Menu.pluck(:place).map{ |place| place.upcase if place }.uniq
  end

  # GET /send_export.json
  def send_export
    export_params = params[:export_params]
    timespan_from = Date.new export_params["timespan_from(1i)"].to_i, 
        export_params["timespan_from(2i)"].to_i, export_params["timespan_from(3i)"].to_i
    timespan_to = Date.new export_params["timespan_to(1i)"].to_i, 
        export_params["timespan_to(2i)"].to_i, export_params["timespan_to(3i)"].to_i

    @menus = Menu.where(place: export_params[:place]).where(date: timespan_from..timespan_to).all

    respond_to do |format|
      format.json { send_data @menus.to_json, type: :json, disposition: "attachment", 
        filename: "your_export.json", status: :ok }
    end
  end

end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Exports", type: :request do
  before :each do
    FactoryGirl.create(:menu)
    FactoryGirl.create(:menu, event: "brunch")
    FactoryGirl.create(:menu, venue: "RESTAURANT")
    FactoryGirl.create(:menu, place: "Hotel Gramercy Park; 52 Gramercy Park North")
  end

  describe "GET /send_export" do

    context 'when selecting filters that matches menu at "HOT SPRINGS, AR"' do
      before do
        query_str = { "export_params" => { "place" => '"HOT SPRINGS, AR"', "from_date(1i)" => "1899",
          "from_date(2i)" => "4", "from_date(3i)" => "13", "to_date(1i)" => "2018",
          "to_date(2i)" => "4", "to_date(3i)" => "13" } }.to_query + "&utf8=%E2%9C%93&format=json&button="
        get "/send_export?" + query_str
      end

      it "returns a json" do
        response.header["Content-Type"].should eql "application/json"
      end

      it "returns a json with correct content" do
        expect(json[0]["place"]).to eq('"HOT SPRINGS, AR"')
      end

      it "returns all matched records" do
        expect(json.size).to eq(3)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when selecting filters that do not matche any menu" do
      before do
        query_str = { "export_params" => { "place" => '"HOT SPRINGS, AR"', "from_date(1i)" => "2018",
          "from_date(2i)" => "4", "from_date(3i)" => "13", "to_date(1i)" => "2018",
          "to_date(2i)" => "4", "to_date(3i)" => "13" } }.to_query + "&utf8=%E2%9C%93&format=json&button="
        get "/send_export?" + query_str
      end

      it "returns a json" do
        response.header["Content-Type"].should eql "application/json"
      end

      it "returns an empty json" do
        expect(json).to be_empty
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

  end
end

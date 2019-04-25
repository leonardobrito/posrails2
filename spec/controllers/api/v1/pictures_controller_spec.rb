require 'rails_helper'

RSpec.describe Api::V1::PicturesController, type: :controller do
  describe "#index" do
    let!(:picture) { create :picture, :with_image }
    before do
      get :index
    end
    it "responds :ok" do
      expect(response).to have_http_status(:ok)
    end
    it "contains all pictures" do
      pictures = ActiveModel::SerializableResource.new(
        Picture.all,
        each_serializer: PictureSerializer
      ).to_json
      expect(response.body).to eq(pictures)
    end
  end
end

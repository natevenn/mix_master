require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe "GET #index" do
    it "assigns all artists to @artists and renders the index template" do
      artist = create(:artist)

      get(:index)

      expect(assigns(:artist)).to eq([artist])
      expect(response).to render_template("index")
    end
  end

  describe "Get #show" do
    it "assigns all artist to @artist and renders the show template" do
      artist = create(:artist)

      get(:show, {:id => artist.to_param})

      expect(assigns(:artist)).to eq(artist)
      expect(response).to render_template("show")
    end
  end

  describe "Get #new" do
    it "assigns a new artist to @artist" do

    get(:new)
    expect(assigns(:artist)).to be_a_new(Artist)
    end
  end

  describe "Get #edit" do
    it "assigns requested artist to @artist" do
      artist = create(:artist)

     get(:edit, {id: artist.to_param})
     expect(assigns(:artist)).to eq(artist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new artist" do
        expect {
          post :create, {:artist => attributes_for(:artist)}
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created artist as @artist" do
        post :create, {:artist => attributes_for(:artist)}
        expect(assigns(:artist)).to be_a(Artist)
        expect(assigns(:artist)).to be_persisted
      end

      it "redirects to the created artist" do
        post :create, {:artist => attributes_for(:artist)}
        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved artist as @artist" do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(assigns(:artist)).to be_a_new(Artist)
      end

      it "re-renders the new templete" do
        post :create, {:artist => attributes_for(:artist, name: nil)}
        expect(response).to render_template("new")
      end
    end

    describe "PUT #update" do
      context "with vaild params" do
        it "updates a artist" do
          artist = create(:artist)
            put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "new name")}
            artist.reload
            expect(artist.name).to eq("new name")
        end

        it "assigns the newly updated artist to @artist" do
          artist = create(:artist)
          put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "new name")}
          expect(assigns(:artist)).to eq(artist)
        end

        it "redirects to the updated artist" do
          artist = create(:artist)
          put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: "new name")}
          expect(response).to redirect_to(Artist.last)
        end
      end

      context "with invalid params" do
        it "updates artist as @artist" do
          artist = create(:artist)
          put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: nil)}
          expect(assigns(:artist)).to eq(artist)
        end

        it "re-renders the edit template" do
          artist = create(:artist)
          put :update, {:id => artist.to_param, :artist => attributes_for(:artist, name: nil)}
          expect(response).to render_template("edit")
        end
      end
    end

   describe "Delete #destroy" do
     it "destroys artist" do
       artist = create(:artist)
       expect {
        delete :destroy, {id: artist.to_param}
       }.to change(Artist, :count).by(-1)
      end

     it "redirects artist to index page" do
       artist = create(:artist)
       delete :destroy, {id: artist.to_param}
       expect(response).to redirect_to(artists_path)
     end
   end
  end
end



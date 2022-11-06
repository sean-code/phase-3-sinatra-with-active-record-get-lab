class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  #Ex:- :default =>''

  # add routes
  get '/bakeries' do
    bakeries=Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries=Bakery.find(params[:id])
    bakeries.to_json(include: :bakeries)
  end

  get '/baked_goods/by_price' do
    baked_goods=BakedGood.find_by price:.desc
    baked_goods.to_json
  end

  # get '/baked_goods/most_expensive' do
  #  self.prices.maximum(:price_field)
  #   most_expensive.to_json
  # end

end

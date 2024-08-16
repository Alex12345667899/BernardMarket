class AddImageToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :image, :string
  end
end

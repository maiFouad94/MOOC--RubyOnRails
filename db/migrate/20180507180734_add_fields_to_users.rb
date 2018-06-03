class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
  	    add_column :users, :name, :string
  	    add_column :users, :DOB, :date
  	    add_column :users, :gender, :integer
   	    add_column :users, :image, :string


  end
end

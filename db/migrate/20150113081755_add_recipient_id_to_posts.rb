class AddRecipientIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :recipient, index: true
  end
end

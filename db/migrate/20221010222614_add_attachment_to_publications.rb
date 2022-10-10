class AddAttachmentToPublications < ActiveRecord::Migration[7.0]
  def change
    add_column :publications, :attachment, :string
  end
end

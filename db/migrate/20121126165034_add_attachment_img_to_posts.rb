class AddAttachmentImgToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.has_attached_file :img
    end
  end

  def self.down
    drop_attached_file :posts, :img
  end
end

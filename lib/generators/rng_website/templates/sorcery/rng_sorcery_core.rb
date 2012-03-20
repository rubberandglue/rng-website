class RngSorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :username,         :null => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string  :crypted_password, :default => nil
      t.string  :salt,             :default => nil
      t.boolean :admin,            :default => false
      t.string  :slug
      t.timestamps
    end

    add_index :users, :slug, unique: true

    puts '====  Seeding default users'
    unless User.find_by_username "admin"
      User.create do |u|
        u.username = "admin"
        u.password = "123456"
        u.admin = true
      end
    end

    unless User.find_by_username "rubberandglue"
      User.create do |u|
        u.username = "rubberandglue"
        u.password = "123456"
        u.admin = true
      end
    end
    puts '====  Successfully seed admin and rubberandglue User, default password: 123456'
  end

  def self.down
    drop_table :users
  end
end
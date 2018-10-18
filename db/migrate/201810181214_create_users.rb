require_relative '../../config/init.rb'

class CreateUsers < ActiveRecord:Migration[5.1]
    def change
        createtable: users do |t|
            t.string :full_name
            t.string :email
            t.string :password_digest
            t.timestamps
        end
    end
end

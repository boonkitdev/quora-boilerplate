require_relative '../../config/init.rb'

class CreateQuestions < ActiveRecord::Migration[5.1]
    def change
        create_table :questions do |t|
            t.string :title
            t.references: user, index: true
            t.timestamps
        end
    end
end
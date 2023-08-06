class AddReferencesToSpellsBooks < ActiveRecord::Migration[6.1]
  def change
      add_foreign_key :books_spells, :books, column: :book_id, primary_key: "id"      
      add_foreign_key :books_spells, :spells, column: :spell_id, primary_key: "id" 
  end
end

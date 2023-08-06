class Book < ApplicationRecord
     has_and_belongs_to_many :spells
    
    validates_presence_of :name, :message => "cannot be blank."
    validates :name, uniqueness: {case_sensitive: false, message: "cannot be the same as an existing book. Case insensitive."}
    
    validates_length_of :name, maximum: 70 
    
    
 #Returns a count of spells associated to the book
  def spell_count
      csize = self.spells.size
      return csize
  end
  
    def self.to_nested_array_for_select
     nested = []  
     Book.order(:name).each do |book|
         nested.push [book.name, book.id]
     end
     return nested 
  end
    
    
    
    
end

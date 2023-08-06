class Spellclass < ApplicationRecord
      has_and_belongs_to_many :spells
    
      validates_presence_of :name, :message => "Name cannot be blank."
      validates :name, inclusion: { in: %w(Bard Cleric Druid Paladin Ranger Sorcerer Warlock Wizard)}
      validates :name, uniqueness: {case_sensitive: false, message: "Name cannot be the same as an existing class. Case insensitive."}
    
     # before_validation :downcase_name   
     # before_save :downcase_name
     
   # private
     #Makes name string all lower case letters
    # def downcase_name
     #  self.name = name.downcase
    #end
end

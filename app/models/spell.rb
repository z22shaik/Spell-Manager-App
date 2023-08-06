class Spell < ApplicationRecord
    has_and_belongs_to_many :books 
    has_and_belongs_to_many :spellclasses
    
    validates_presence_of :name, :message => "cannot be blank."
    
    validates_length_of :name, maximum: 70 

    validates :name, uniqueness: {case_sensitive: false, message: "cannot be the same as an existing spell. Case insensitive."}

    validates_presence_of :school, :message => "cannot be blank."
    
    validates_presence_of :level

    validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9 

    validates :school, inclusion: { in: %w(Conjuration Necromancy Evocation Abjuration Transmutation Divination Enchantment Illusion)} 
    
    validates_presence_of :spellclasses, :message => ":A spell must have one or more classes."
    
    validates_presence_of :concentration
    
    validates :concentration, inclusion: { in: %w(Yes No)} 
    
    validates :description, exclusion: {in: [nil], message: "cannot be nil"} 
    
    validates_length_of :description, maximum: 4096 
    
  #Returns a list of spellclasses associated to a spell
  def spellclass_string
      s = ""
      csize = self.spellclasses.size
      self.spellclasses.each_with_index do |spellclass, i|
              if i < csize-1
                s += "#{spellclass.name}, "
              elsif i == csize - 1
                s += "#{spellclass.name}"
              end
      end
      return s
  end
    
    
   # before_validation :downcase_school  
    #before_save :downcase_school
    #before_validation :downcase_concentration
    #before_save :downcase_concentration
    
    
  #private
    #Makes concentration string all lower case letters
   # def downcase_concentration
    # self.concentration = concentration.downcase
    #end
    
    
    #private
    #Makes school string all lower case letters
    #def downcase_school
    # self.school = school.downcase
    #end
end

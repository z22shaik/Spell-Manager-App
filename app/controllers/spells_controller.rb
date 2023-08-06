class SpellsController < ApplicationController
  def index
      @spells = Spell.order(:level, :name)
  end

  def create
       @spell = Spell.new(spell_params)
       spell_name = @spell.name

    if @spell.save
      flash[:notice] = "Successfully added #{spell_name} to All Spells"
      redirect_to spells_path
      return
    else
      render :new
    end
  end

  def new
      @spell = Spell.new
  end

  def edit
         @spell = Spell.find params[:id]
  end

  def show
       @spell = Spell.find params[:id]
  end

  def update
   @spell = Spell.find params[:id]  
   spell_name = @spell.name
    if @spell.update(spell_params)
      flash[:notice] = "#Successfully edited #{spell_name}." 
      redirect_to spells_path
    else
      render :edit
    end
  end

  def destroy
    @spell = Spell.find(params[:id])  
    if @spell.destroy
        flash[:notice] = 'Spell was successfully deleted.'
    else
        flash[:notice] = 'Unable to delete spell.'
    end
    redirect_to spells_path 
  end
    
  def spell_add
    @spell = Spell.find(params[:id])  
      
  end 
    
 def spell_create
   @book = Book.find(params[:spell][:book_id])
  @spell = Spell.find(params[:id])
  
     if !@book.spells.include?(@spell)
   @spell.books.push @book
       flash[:notice] =  "Successfully added #{@spell.name} to #{@book.name}"
     else 
          flash[:notice] =  "Can not add spell to book."
     end
        redirect_to spells_path 
  end 

# Only allow a trusted parameter "white list" through.
    def spell_params
      sp = params.require(:spell).permit(:level, :name, :school, :concentration, :description, :book_id, :spellclass_ids => [])
       sp[:spellclass_ids] = sp[:spellclass_ids].reject { |c| c.empty? }        
      return sp  
    end





end

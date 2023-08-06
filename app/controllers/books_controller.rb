class BooksController < ApplicationController
  def index
  @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Successfully added #{@book.name} to All Books."  
      redirect_to @book
    else
      render :new
    end
  end

  def new
      @book = Book.new
  end

  def edit
  end

  def show
  @book = Book.find params[:id]
  end

  def update
         @book = Book.find(params[:id])  
   @spell = Spell.find params[:spell_id]
  
   @book.spells.push(@spell)
  end
    
 def remove_spell
    
 @spell = Spell.find params[:spell_id]

       @book = Book.find params[:id]
       @book.spells.delete(@spell)
          flash[:notice] = "Successfully removed #{@spell.name} from #{@book.name}"
  redirect_to @book
  
  end
    

  def destroy
    @book = Book.find(params[:id])  
    if @book.destroy
        flash[:notice] = "Successfully deleted #{@book.name}."
    else
        flash[:notice] = 'Unable to delete book.'
    end
    redirect_to books_url 
  end
    
      def spell_add
   @book = Book.find(params[:id])  
          
      
  end 
    
     def spell_create
   @book = Book.find(params[:id])  
   @spell = Spell.find params[:spell_id]
   if !@book.spells.include?(@spell)
   @book.spells.push @spell
       flash[:notice] =  "Successfully added #{@spell.name} to #{@book.name}" 
     else 
          flash[:notice] =  "Can not add spell to book."
     end
          redirect_to @book
      
  end 
    
     private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:book).permit(:name, :spell_id)
    end
    
    
    
    
end

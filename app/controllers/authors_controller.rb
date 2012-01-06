class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])
    respond_to do |format|
      if @author.save
        format.html { redirect_to(@author, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @author = Author.find(params[:id])
  end


end

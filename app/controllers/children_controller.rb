class ChildrenController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!, :only => [:archived, :archive, :unarchive, :edit]
  # GET /children
  # GET /children.xml
  def index
    respond_to do |format|
      format.html {}
      format.json {
        @children = Child.where(:archive => false).jtable_basic_query(params[:jTableQuery])
        render :json => jtable_for_json(:basic, @children, params[:jTableQuery])
      }
      format.xml  { render :xml => @icd_codes }
      format.xls  {@children = Child.all}
    end
  end
  
  def archived
    respond_to do |format|
      format.html {}
      format.json {
        @children = Child.where(:archive => true).jtable_basic_query(params[:jTableQuery])
        render :json => jtable_for_json(:basic, @children, params[:jTableQuery])
      }
      format.xml  { render :xml => @icd_codes }
    end
  end

  # GET /children/1
  # GET /children/1.xml
  def show
    @child = Child.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @children }
    end
  end

  # GET /children/new
  # GET /children/new.xml
  def new
    @child = Child.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @children }
    end
  end

  # GET /children/1/edit
  def edit
    @child = Child.find(params[:id])
  end

  # POST /children
  # POST /children.xml
  def create
    if params[:child][:upload]
      file = params[:child][:upload].read
      file.each_line do |child|
        name, age, sex, treatment, address = child.chomp.split(",")
        Child.create!(:name => name, :age => age, :sex => sex, :treatment => treatment, :address => address)
      end
      redirect_to(children_url)
    else
      @children = Child.new(params[:child])
      respond_to do |format|
        if @children.save
          format.html { redirect_to(@children, :notice => 'Child was successfully created.') }
          format.xml  { render :xml => @children, :status => :created, :location => @child }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @children.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /children/1
  # PUT /children/1.xml
  def update
    @children = Child.find(params[:id])

    respond_to do |format|
      if @children.update_attributes(params[:child])
        format.html { redirect_to(@children, :notice => 'Child was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @children.errors, :status => :unprocessable_entity }
      end
    end
  end

  def upload
    @children = Child.new
  end
  
  def archive
    @children = Child.find(params[:id])
    @children.archive = true
    @children.save
    
    respond_to do |format|
      format.html {redirect_to(children_url) }
    end
  end
  
  def unarchive
    @children = Child.find(params[:id])
    @children.archive = false
    @children.save
    
    respond_to do |format|
      format.html {redirect_to(archived_children_path) }
    end
  end
  
end

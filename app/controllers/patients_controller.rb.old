class PatientsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin!, :only => [:archived, :archive, :unarchive, :edit]
  # GET /patients
  # GET /patients.xml
  def index
    respond_to do |format|
      format.html {}
      format.json {
        @patients = Patient.where(:archive => false).jtable_basic_query(params[:jTableQuery])
        render :json => jtable_for_json(:basic, @patients, params[:jTableQuery])
      }
      format.xml  { render :xml => @icd_codes }
      format.xls  {@patients = Patient.all}
    end
  end
  
  def archived
    respond_to do |format|
      format.html {}
      format.json {
        @patients = Patient.where(:archive => true).jtable_basic_query(params[:jTableQuery])
        render :json => jtable_for_json(:basic, @patients, params[:jTableQuery])
      }
      format.xml  { render :xml => @icd_codes }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.xml
  def create
    if params[:patient][:upload]
      file = params[:patient][:upload].read
      file.each_line do |patient|
        name, age, sex, treatment, address, source = patient.chomp.split(",")
        Patient.create!(:name => name, :age => age, :sex => sex, :treatment => treatment, :address => address, :source => source)
      end
      redirect_to(patients_url)
    else
      @patient = Patient.new(params[:patient])
      respond_to do |format|
        if @patient.save
          format.html { redirect_to(@patient, :notice => 'Patient was successfully created.') }
          format.xml  { render :xml => @patient, :status => :created, :location => @patient }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to(@patient, :notice => 'Patient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  def upload
    @patient = Patient.new
  end
  
  def archive
    @patient = Patient.find(params[:id])
    @patient.archive = true
    @patient.save
    
    respond_to do |format|
      format.html {redirect_to(patients_url) }
    end
  end
  
  def unarchive
    @patient = Patient.find(params[:id])
    @patient.archive = false
    @patient.save
    
    respond_to do |format|
      format.html {redirect_to(archived_patients_path) }
    end
  end
  
end

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
        name, address, telephone, age, sex, treatment, source, plhiv_code, plhiv_name, support_group, weight, treatment_code, date_registered, occupation, marital_status, children, line_of_treatment, next_of_kin_contact, disclosed_status, transfer_in, transfer_out, co_infected, treatment, type_of_service_received, deceased = patient.chomp.split(",")
        Patient.create!(:name => name.strip, :address => address.strip, :telephone => telephone.strip, :age => age.strip, :sex => sex.strip, :treatment => treatment.strip, :source => source.strip, :plhiv_code => plhiv_code.strip, :plhiv_name => plhiv_name.strip, :support_group => support_group.strip, :weight => weight.strip, :treatment_code => treatment_code.strip, :date_registered => date_registered.strip, :occupation => occupation.strip, :marital_status => marital_status.strip, :children => children.strip, :line_of_treatment => line_of_treatment.strip, :next_of_kin_contact => next_of_kin_contact.strip, :disclosed_status => disclosed_status.strip, :transfer_in => transfer_in.strip, :transfer_out => transfer_out.strip, :co_infected => co_infected.strip, :treatment => treatment.strip, :type_of_service_received => type_of_service_received.strip, :deceased => deceased.strip)
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

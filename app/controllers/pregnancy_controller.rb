class PregnancyController < ActionController::Base

  def edit
    @patient_data_id = params[:patient_data_instance_id]
    @patient_data = PatientData.find(@patient_data_id)
    render :partial  => 'edit', :locals => {:patient_data => @patient_data}
  end

  def update
    @patient_data_id = params[:patient_data_instance_id]
    @patient_data = PatientData.find(@patient_data_id)
    pregnancy = false;
    if params[:pregnant] == 'on'
      pregnancy = true
    end
    @patient_data.pregnant = pregnancy
    @patient_data.save!
    render :partial  => 'show', :locals => {:patient_data => @patient_data}
  end

end

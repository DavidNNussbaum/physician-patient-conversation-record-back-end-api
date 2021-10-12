class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]
    skip_before_action :authorized, only: [:create, :index]

    def index 
        @patients = Patient.order_by_initials
        render json: PatientSerializer.new(@patients).serializable_hash 
    end

    def show
        render json: PatientSerializer.new(@patient).serializable_hash
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            render json:  PatientSerializer.new(@patient).serializable_hash, status: :created 
        else
            render json: { error: @patient.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end
    end

    private
        def set_patient
            @patient = Patient.find(params[:id])
        end

        def patient_params
            params.require(:patient).permit(:initials, :dob)
        end
end
 
         
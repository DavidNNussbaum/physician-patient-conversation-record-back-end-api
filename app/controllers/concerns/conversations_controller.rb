class ConversationsController < ApplicationController
    before_action :set_conversation, only: [:update, :destroy]
    before_action :authorized, only: [:create, :update, :destroy]
    
        def index
            patient = Patient.find_by(id: params[:patient_id])
            @conversations = patient.conversations
            render json: ConversationSerializer.new(@conversations).serializable_hash
        end
    
        def create
            @conversation = current_user.conversations.new(conversation_params)
            if @conversation.save
                render json:  ConversationSerializer.new(@conversation).serializable_hash, status: :created 
            else
              render json: { error: @conversation.errors.full_messages.to_sentence}, status: :unprocessable_entity
            end
        end
    
        def update
            if @conversation.update(conversationn_params)
                render json: ConversationnSerializer.new(@conversation).serializable_hash
            else
              render json: { error: @conversation.errors.full_messages.to_sentence}, status: :unprocessable_entity
            end
        end
    
        def destroy
            if @conversation.destroy
              render json: {message: "Conversation successfully removed"}
            else
              render json: {message: "Something went wrong! Errors: #{@conversation.errors.full_messages.to_sentence}"}
            end
          end
        
          private
             
            def set_conversation
              @conversation = current_user.conversations.find(params[:id])
            end
        
             
            def conversation_params
              params.require(:conversation).permit(:date_time, :details, :issue_resolved, :patient_id, :user_id )
            end
        end

         
    
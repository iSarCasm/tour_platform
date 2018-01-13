module Ext
  module Admin
    class NotesController < ApplicationController
      NOTEABLE_MODELS = [
        :Coach, :TourCoach, :Hotel, :TourHotel, :Ferry, :FerryDate, :User, :TourExcursion
      ].freeze

      def index
        authorize_admin! :access, :rails_admin
        authorize_admin! :read, noteable_type
        @notes = Note.where('noteable_id = ?', params[:id])
                     .where('noteable_type = ?', params[:noteable_type])
      end

      def create
        authorize_admin! :access, :rails_admin
        authorize_admin! :read, note_noteable_type
        current_user.notes.create(note_params)
        render plain: 'Success!'
      end

      def destroy
        authorize_admin! :access, :rails_admin
        @note = current_user.notes.find(params[:id])
        authorize_admin! :destroy, @note
        @note.destroy!
        render plain: 'Success!'
      end

      private

      def noteable_type
        model = NOTEABLE_MODELS.find do |type|
          params[:noteable_type].to_sym == type
        end
        raise ArgumentError, 'Malicious constant' unless model
      end

      def note_noteable_type
        model = NOTEABLE_MODELS.find do |type|
          params[:note][:noteable_type].to_sym == type
        end
        raise ArgumentError, 'Malicious constant' unless model
      end

      def note_params
        params.require(:note).permit(:message, :noteable_type, :noteable_id)
      end
    end
  end
end

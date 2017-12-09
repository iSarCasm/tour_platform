module Ext
  module Admin
    class NotesController < ApplicationController
      def index
        authorize_admin! :access, :rails_admin
        authorize_admin! :read, params[:type].capitalize.constantize
        @notes = Note
                  .where('noteable_id = ?', params[:id])
                  .where('noteable_type = ?', params[:type].capitalize)
      end

      def create
        authorize_admin! :access, :rails_admin
        authorize_admin! :read, note_params[:noteable_type].capitalize.constantize
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

      def note_params
        params.require(:note).permit(:message, :noteable_type, :noteable_id)
      end
    end
  end
end

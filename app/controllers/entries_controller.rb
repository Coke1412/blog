class EntriesController < ApplicationController
    before_action :set_entries, only: [:edit, :update, :destroy]

    def index
        @entry_open = Entry.where(status: 'en curso')
        @entry_close = Entry.where(status: 'cerrada')
    end

    def new
        @entry = Entry.new
    end

    def create
        @entry = Entry.new(entry_params)  #recibe los parametros de abajo, del formulario

        if @entry.save
            redirect_to root_path, notice: 'Entrada guardada owo'
        else
            redirect_to new_entries_path, alert: 'Entrada no guardada uwu'
        end
    end

    def edit
        @entry = Entry.find(params[:id])
    end

    def update
        @entry.update(entry_params)

        if @entry.save
            redirect_to root_path, notice: 'Entrada guardada owo'
        else
            redirect_to edit_entry_path, alert: 'Entrada no guardada uwu'
        end
    end

    def destroy
        @entry.destroy
        redirect_to root_path, notice: 'El registro fue eliminado uwu'
    end

    



    private

    def entry_params
        params.require(:entry).permit(:title, :content, :status)
    end

    def set_entries
        @entry = Entry.find(params[:id])
    end

end
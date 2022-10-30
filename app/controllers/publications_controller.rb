class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]

  # GET /publications or /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1 or /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new(project_id: params[:project_id])
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)

      if @publication.save
        if params[:commit] = "submit"
          redirect_to @publication.project, notice: "The publication \"#{@publication.title}\" has been added successfully."
        elsif params[:commit] = "add_more"
          redirect_to new_publication_path(project_id: @publication.project), notice: "The publication \"#{@publication.title}\" has been added successfully."
        end
      else
         render "new"
      end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:project_id, :title, :document, authors: [])
    end
end

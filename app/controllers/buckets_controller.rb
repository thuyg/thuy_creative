class BucketsController < ApplicationController
  
  layout 'admin' # use admin layout
  
  before_action :confirm_logged_in
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all
    
    respond_to do |format|
      format.html
      format.json
    end
    
  end

  # GET /buckets/1
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      redirect_to @bucket, notice: 'Bucket was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /buckets/1
  def update
    if @bucket.update(bucket_params)
      redirect_to @bucket, notice: 'Bucket was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /buckets/1
  def destroy
   @bucket.destroy
   redirect_to buckets_url, notice: 'Bucket was successfully destroyed.'
  end
  
  # DELETE /buckets/1
  # DELETE /buckets/1.json
  #def destroy
  #  @bucket.destroy
  #  respond_to do |format|
  #    format.html { redirect_to buckets_url }
  #    format.json { head :no_content }
  #  end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bucket_params
      params.require(:bucket).permit(:name, :attachment)
    end
end

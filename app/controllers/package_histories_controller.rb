class PackageHistoriesController < ApplicationController
  # GET /package_histories
  # GET /package_histories.xml
  def index
    @package_histories = PackageHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @package_histories }
    end
  end

  # GET /package_histories/1
  # GET /package_histories/1.xml
  def show
    @package_history = PackageHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @package_history }
    end
  end

  # GET /package_histories/new
  # GET /package_histories/new.xml
  def new
    @package_history = PackageHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @package_history }
    end
  end

  # GET /package_histories/1/edit
  def edit
    @package_history = PackageHistory.find(params[:id])
  end

  # POST /package_histories
  # POST /package_histories.xml
  def create
    @package_history = PackageHistory.new(params[:package_history])

    respond_to do |format|
      if @package_history.save
        format.html { redirect_to(@package_history, :notice => 'Package history was successfully created.') }
        format.xml  { render :xml => @package_history, :status => :created, :location => @package_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @package_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /package_histories/1
  # PUT /package_histories/1.xml
  def update
    @package_history = PackageHistory.find(params[:id])

    respond_to do |format|
      if @package_history.update_attributes(params[:package_history])
        format.html { redirect_to(@package_history, :notice => 'Package history was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @package_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /package_histories/1
  # DELETE /package_histories/1.xml
  def destroy
    @package_history = PackageHistory.find(params[:id])
    @package_history.destroy

    respond_to do |format|
      format.html { redirect_to(package_histories_url) }
      format.xml  { head :ok }
    end
  end
end

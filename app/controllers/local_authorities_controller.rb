class LocalAuthoritiesController < ApplicationController
  def index
    @local_authorities = LocalAuthority.all
  end

  def new
    @local_authority = LocalAuthority.new
  end

  def create
    @local_authority = LocalAuthority.new(set_params)
    if @local_authority.save
      redirect_to @local_authority
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @local_authority = LocalAuthority.find(params[:id])
  end

  def show
    @local_authority = LocalAuthority.find(params[:id])
  end

  def update
    @local_authority = LocalAuthority.find(params[:id])
    if @local_authority.update(set_params)
      redirect_to @local_authority
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @local_authority = LocalAuthority.find(params[:id])
    @local_authority.destroy
    redirect_to local_authorities_path
  end



  private 
  def set_params
    params.require(:local_authority).permit(:name, :contact_number, :address, :department, :email)
  end

end

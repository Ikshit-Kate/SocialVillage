
class LocalAuthoritiesController < ApplicationController
  before_action :find_authority, only: %i[show edit update destroy]

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
  end

  def show
  end

  def update
    if @local_authority.update(set_params)
      redirect_to @local_authority
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @local_authority.destroy
    redirect_to local_authorities_path
  end

  def send_sos
    authority_email = params[:email]
    user = current_user
    SosMailer.send_sos(authority_email, user).deliver_now
    redirect_to local_authorities_path, notice: 'SOS sent to the authority'
  end 


  private

  def find_authority
    @local_authority = LocalAuthority.find(params[:id])
  end

  def set_params
    params.require(:local_authority).permit(:name, :contact_number, :address, :department, :email)
  end
end

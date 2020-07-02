class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit show update destroy]
  access all: %i[show index angular], user: { except: %i[destroy new create update edit] }, site_admin: :all

  # Apply our custom layout
  layout 'portfolio'

  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    # This method allows the controller to display items only referencing angular by using the created angular keyword
    # created within the portfolio model -- note there are two methodologies utilized to create this parameter in the model
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # Another debugging tool that opens a pry console with this placement
    # binding.pry
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Deleted the record successfully' }
      format.json { head :no_content }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end

class RostersController < ApplicationController
before_action :authenticate_user!, except: [:update]
  
  def index
    @rosters = Roster.where(user_id:current_user.id)
  end

def show
   @roster = Roster.includes(:troops).find(params[:id])
   @roster.user_id = current_user.id  
   @roster_json = RosterSerializer.new(@roster).to_hash.to_json
   @units = Unit.where(army_id: @roster.army_id)
end

def new
    @roster = Roster.new
   @roster.user_id = current_user.id  
    @army_options = Army.all.map{|u| [ u.name, u.id ] }    
end

  def create
    @roster = Roster.new(roster_params) 
   @roster.user_id = current_user.id  
    if @roster.valid?
      @roster.save
      redirect_to :action => 'show', :id => @roster.id
    else
      render json: { errors: @roster.errors.full_messages }, status: 422
    end
  end

  def update
    roster = Roster.find_by(id: params[:id])
    roster.troops.delete_all
    roster.update(roster_params)
    if roster.valid?
      roster.save
      render json: RosterSerializer.new(roster).to_hash
    else
      render json: { errors: roster.errors.full_messages }, status: 422
    end    
  end  

 def destroy
    @roster = Roster.find params[:id]
    @roster.destroy
    redirect_to :action => 'index'
  end  

  private

  def roster_params
    params.require(:roster).permit(:id, :name, :army_id, :points_limit, troops_attributes: [:unit_id, :roster_id, :total_price, :unit_size])
  end
end

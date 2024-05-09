class PrototypesController < ApplicationController

  def index
  end

  def create
    Prototype.create
  end

  def new
    @prototype = Prototype.new
  end

end

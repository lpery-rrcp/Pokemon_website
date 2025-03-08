class TypesController < ApplicationController
  def name
    @types = Type.all
  end
end

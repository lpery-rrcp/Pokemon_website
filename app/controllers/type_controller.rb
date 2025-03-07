<<<<<<< HEAD
class TypeController < ApplicationController
  def name
=======
class TypesController < ApplicationController
  def name
    @types = Type.all
>>>>>>> recovery-branch
  end
end

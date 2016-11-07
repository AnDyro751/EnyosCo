class MainController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all.reverse
  end

  def unregistered
  end

  def helper
  end
end

class BoardsController < ApplicationController
  def index
    #matching_boards = Board.all

    #@list_of_boards = matching_boards.order({ :created_at => :desc })

    render({ :template => "boards/index" })
  end
  def users
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "boards/users" })
  end
  def photos
    matching_photos = Photo.all
    @list_of_photos = matching_photos #.order({ :username => :asc })
    @now=DateTime.now
    render({ :template => "boards/photos" })
  end
  def showPhoto
    if current_user==nil
      redirect_to("/photos", { :alert => "You need to sign in or sign up before continuing." }); return
    end
    the_id = params.fetch("path_id")
    @the_photo = Photo.where({:id=>the_id}).at(0)
    render({ :template => "boards/a_photo" })
  end
  def showUser
    username=params.fetch("username")
    @the_user=User.where({:username=>username}).at(0)
    @real_followers=@the_user.received_follow_requests.where({:status=>"accepted"})
    @real_followings=@the_user.sent_follow_requests.where({:status=>"accepted"})
    render({ :template => "boards/a_user" })
  end
  def likedPhotos
    username=params.fetch("username")
    @the_user=User.where({:username=>username}).at(0)
    render({ :template => "boards/likedPhotos" })
  end
  def feed
    username=params.fetch("username")
    @the_user=User.where({:username=>username}).at(0)
    accepted_follow_reqs=@the_user.sent_follow_requests.where({:status=>"accepted"})
    @real_following=accepted_follow_reqs
    render({ :template => "boards/userFeed" })
  end
  def discover
    username=params.fetch("username")
    @the_user=User.where({:username=>username}).at(0)
    @real_followings=@the_user.sent_follow_requests.where({:status=>"accepted"})
    render({ :template => "boards/discover" })
  end
  def like
    the_like=Like.new
    the_like.fan_id=current_user.id
    the_like.photo_id=params.fetch("photo_id")
    the_like.save
    photo_id=params.fetch("photo_id")
    redirect_to("/photos/#{photo_id}", { :notice => "Like created successfully." })
  end
  def unlike
    the_photo=params.fetch("photo_id")
    the_like=Like.where({:fan_id=>current_user.id,:photo_id=>the_photo}).at(0)
    the_like.destroy
    redirect_to("/photos/#{the_photo}", { :alert => "Like deleted successfully." })
  end
  def comment
    the_comment=Comment.new
    the_comment.author_id=current_user.id
    the_comment.body=params.fetch("query_body")
    the_comment.photo_id=params.fetch("photo_id")
    the_comment.save
  end
  def newPhoto
    the_photo=Photo.new
    the_photo.caption=params.fetch("query_caption")
    the_photo.image=params.fetch("query_image")
    the_photo.likes_count=0
    the_photo.comments_count=0
    the_photo.owner_id=current_user.id
    the_photo.save
    redirect_to("/photos", { :notice => "Photo created successfully." })
  end

end

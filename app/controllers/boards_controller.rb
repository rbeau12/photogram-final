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
end

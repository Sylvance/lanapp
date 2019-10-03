class SearchController < ApplicationController
  def search_courses
    courses = Course.search(search_resource_params, prefix: true, fuzziness: 1).results
    courses = Course.filter(filtering_params)
    paginate json: courses
  end

  def search_playlists
    playlists = Playlist.search(search_resource_params, prefix: true, fuzziness: 1).results
    paginate json: playlists
  end

  def search_videos
    videos = Video.search(search_resource_params, prefix: true, fuzziness: 1).results
    paginate json: videos
  end

  def search_photos
    photos = Photo.search(search_resource_params, prefix: true, fuzziness: 1).results
    paginate json: photos
  end

  def search_users
    users = User.search(search_user_params, prefix: true, fuzziness: 1).results
    paginate json: users
  end

  private

  # Only allow a trusted parameter "white list" through.
  def search_user_params
    params.require(:search).permit(:name)
  end

  def search_resource_params
    params.require(:search).permit(:title)
  end

  def filtering_params
    params.slice(:by_price_range, :by_recent)
  end
end

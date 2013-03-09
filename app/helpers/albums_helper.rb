
module AlbumsHelper
  def display_bulk_albums_multiple_artists
    list_of_artists = Array.new
    raw_html = String.new
    @results.each do |result|
      list_of_artists << result[:artist]
    end
    list_of_artists.uniq!.each do |artist|
      raw_html << "<div id='#{artist.parameterize}'>"
      raw_html << "<h2 class='artist'>#{artist}</h2>"
      raw_html << '<table class="table table-striped">
      <tr>
      <th width="40%">Album</th>
      <th width="10%">ID</th>
      <th width="10%">Discogs ID</th>
      <th width="20%">Genres</th>
      <th width="20%"></th>
      </tr>
      '
      @results.each do |result|
        if result[:artist] == artist
          raw_html << "
          <tr>
          <td width='40%''>#{result[:title]}</td>
          <td width='10%'>#{result[:year]}</td>
          <td width='10%'>#{result[:discogs_id]}</td>
          <td width='20%'>#{result[:genres]}</td>
          <td width='20%'>#{link_to 'Add This Album', albums_path(:discogs_id => result[:discogs_id]), :method => 'POST'}</td>
          </tr>
          "
        end
      end
      raw_html << "</table></div>"
    end
    raw_html
  end
end

class ContactPoint < Middleman::DataModel::SimpleDataModel

  def self.twitter
    find_by_type "twitter"
  end

  def self.github
    find_by_type "github"
  end

  def self.find_by_type(type)
    all.find {|contact| contact.type == type }
  end

  def tag
    info_text_for_type(type)
  end

  def url
    info_url_for_type(type)
  end

  private

  def info_text_for_type(type)
    if type == "twitter"
      "<a href='http://twitter.com/#{@info}'>#{@info}</a>"

    elsif type == "github"
      "<a href='http://github.com/#{@info}'>#{@info}</a>"

    elsif type == "email"
      "<a href='mailto:#{@info}'>#{@info}</a>"
    else
      @info
    end
  end

  def info_url_for_type(type)
    if type == "twitter"
      "http://twitter.com/#{@info}"
    elsif type == "github"
      "http://github.com/#{@info}"
    elsif type == "email"
      "mailto:#{@info}"
    else
      @info
    end
  end

end
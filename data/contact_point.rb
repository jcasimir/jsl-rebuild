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
    if url
      "<a href='#{url}'>#{info}</a>"
    else
      info
    end
  end

end
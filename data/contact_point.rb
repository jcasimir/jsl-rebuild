class ContactPoint < Middleman::DataModel::SimpleDataModel

  def info
    info_text_for_type(type)
  end

  private

  def info_text_for_type(type)
    if type == "twitter"
      "<a href='http://twitter.com/#{@info}'>#{@info}</a>"
    elsif type == "email"
      "<a href='mailto:#{@info}'>#{@info}</a>"
    else
      "<a href=''>#{@info}</a>"
    end
  end

end
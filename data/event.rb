class Event < Middleman::DataModel::SimpleDataModel

  def image?
    !!image_url
  end
  
  def tickets?
    !!tickets_url
  end
end
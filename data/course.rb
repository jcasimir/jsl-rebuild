class Course < Middleman::DataModel::SimpleDataModel

  def topics
    Array(@topics).map do |topic_hash|
      self.class.new topic_hash
    end
  end

  def has_topics?
    topics && !topics.empty?
  end

end
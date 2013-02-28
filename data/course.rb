class Course < Middleman::DataModel::SimpleDataModel

  def topics
    Array(@topics).map do |subtopic|
      if subtopic.is_a? String
        topic_hash = { name: subtopic }
      else
        topic_hash = subtopic
      end
      self.class.new topic_hash
    end
  end

  def has_topics?
    topics && !topics.empty?
  end

end
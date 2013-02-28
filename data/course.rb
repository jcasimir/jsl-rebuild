class Course < Middleman::DataModel::SimpleDataModel

  #
  # Access the raw sub-topics and convert them into Course objects as well.
  #
  # This allows for a course topic to also define sub-topics and for those
  # sub-topics to also define sub-topics ...
  #
  #
  # @example Definition of a sub-topic with explicit calling out the name
  #
  #     name: Intermediate Topics
  #     topics:
  #     -
  #       name: Test-Driven Development with RSpec (2 Days)
  #     -
  #       name: RSpec Best Practices (1 Day)
  #     -
  #       name: Ruby Object Systems & Fundamentals (2 Days)
  #     -
  #       name: Interacting with 3rd Party Services (1 Day)
  #
  # @example Definition of a sub-topic implicit string value is a name
  #
  #     name: Intermediate Topics
  #     topics:
  #     -
  #       Test-Driven Development with RSpec (2 Days)
  #     -
  #       RSpec Best Practices (1 Day)
  #     -
  #       Ruby Object Systems & Fundamentals (2 Days)
  #     -
  #       Interacting with 3rd Party Services (1 Day)
  #
  def topics
    Array(@topics).map do |subtopic_data|
      convert_subtopic_to_course(subtopic_data)
    end
  end

  def has_topics?
    topics && !topics.empty?
  end

  private

  #
  # Convert a single name, String, or a hash of course parameters into a Course
  # object.
  #
  # #see topics
  #
  def convert_subtopic_to_course(subtopic_data)
    subtopic_data = { name: subtopic_data } if subtopic_data.is_a? String
    self.class.new subtopic_data
  end

end
class Team < Middleman::DataModel::SimpleDataModel

  def self.find_by_name(name)
    all.find {|member| member.nickname == name || member.name == name }
  end

end
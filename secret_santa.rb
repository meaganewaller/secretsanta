class SecretSanta
  Santa = Struct.new(:first_name, :family_name, :email, :potential_assignees, :assignee)

  attr_reader :santas

  def initialize(file)
    santa_info = File.open(file).read.split("\n")
    @santas = santa_info.each_with_object([]) do |santa, santas|
      first_name, family_name, email = santa.split
      santas << Santa.new(first_name, family_name, email)
    end
    set_potential_assignees
    set_assignee
  end

  def set_potential_assignees
    @santas.map do |santa|
      santa.potential_assignees = @santas.reject { |s| s.family_name == santa.family_name }
    end
  end

  def set_assignee
    @santas.map do |santa|
      santa.assignee = santa.potential_assignees.sample
    end

    if @santas.map(&:assignee).map(&:email).uniq.count != @santas.count
      set_assignee
    else
      return
    end
  end
end

class SecretSanta
  attr_reader :santas

  def initialize(file)
    @santas = File.open(file).read.split("\n").map { |s| s.split }
  end

  def potential_santas
    # Gives a data structure that looks like:
    # [{ "First Name Family Name" => ["email", "email", "email"]}]
    @santas.map do |santa|
      { "#{santa[0]} #{santa[1]}" => @santas.reject { |s| s[1] == santa[1] }.map { |s| s[2]}.flatten }
    end
  end

  def pick_santas(potentials)
    picked = potentials.map do |potential|
      { "#{potential.keys[0]}" => potential.values.flatten.sample }
    end

    assigned = get_assigned(picked)

    if unique_assigneds(assigned) != @santas.count
      pick_santas(potentials)
    else
      return picked
    end
  end

  private
  def get_assigned(picked)
    picked.map do |santa|
      santa.map do |k, v|
        v
      end
    end
  end

  def unique_assigneds(assigned)
    assigned.flatten.uniq.count
  end
end

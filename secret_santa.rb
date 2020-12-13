require 'pry'
require 'pry-nav'
class SecretSanta
  attr_accessor :santas

  def initialize(file)
    @santas = File.open(file).read.split("\n").map { |s| s.split }
  end

  def potential_santas
    # Give a data structure that looks like:
    # [{ "First Name Family Name" => ["email", "email", "email"]}]
    @santas.map do |santa|
      { "#{santa[0]} #{santa[1]}" => @santas.reject { |s| s[1] == santa[1] }.map { |s| s[2]}.flatten }
    end
  end

  def pick_santas(potentials)
    picked = potentials.map do |potential|
      { "#{potential.keys[0]}" => potential.values.flatten.sample }
    end

    assigned = picked.map do |santa|
      santa.map do |k, v|
        v
      end
    end

    if assigned.flatten.uniq.count != @santas.count
      pick_santas(potentials)
    else
      return picked
    end
  end
end

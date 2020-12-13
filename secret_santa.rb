require 'pry'
require 'pry-nav'
class SecretSanta
  attr_accessor :santas

  def initialize(file)
    @santas = File.open(file).read.split("\n").map { |s| s.split }
  end

  def potential_santas
    @santas.map do |santa|
      { "#{santa[0]} #{santa[1]}" => @santas.reject { |s| s[1] == santap[1] } }
    end
  end
end

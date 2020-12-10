class SecretSanta
  attr_accessor :santas

  def initialize(file)
    @santas = File.open(file).read.split("\n")
  end
end

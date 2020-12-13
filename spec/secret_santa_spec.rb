require 'spec_helper'
require './secret_santa'

describe SecretSanta do
  it "receives a list of names and emails and creates santas" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.santas).to_not be_empty
  end

  it "doesn't allow someone to be assigned to their family member" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.potential_santas[0]["Alice Jones"]).to eql [["Demi", "Smith", "<demi@example.com>"], ["Eli", "Smith", "<eli@example.com>"], ["Florence", "Williams", "<florence@example.com>"]]
  end

  it "picks a random person from the potential santas list" do
    secret_santa = SecretSanta.new('./santas.txt')
    potentials = secret_santa.potential_santas
    picked = secret_santa.pick_santas(potentials)

    assigned = picked.map do |santa|
      santa.map do |k, v|
        v
      end
    end

    expect(assigned.flatten.uniq.count).to eql secret_santa.santas.count
  end
end

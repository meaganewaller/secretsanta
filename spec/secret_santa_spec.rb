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
end

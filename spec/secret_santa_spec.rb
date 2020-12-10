require 'spec_helper'
require './secret_santa'

describe SecretSanta do
  it "receives a list of names and emails and creates santas" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.santas).to_not be_empty
  end
end

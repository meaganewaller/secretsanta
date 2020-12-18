require 'spec_helper'
require './secret_santa'

describe SecretSanta do
  it "receives a list of names and emails and creates santas" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.santas).to_not be_empty
  end

  it "doesn't allow a santa to be assigned a family member" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.santas.first.potential_assignees.map(&:family_name)).to_not include secret_santa.santas.first.family_name
  end

  it "picks a random person from the potential santas list" do
    secret_santa = SecretSanta.new('./santas.txt')
    expect(secret_santa.santas.map(&:assignee).map(&:email).uniq.count).to eql secret_santa.santas.count
  end
end

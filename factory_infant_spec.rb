require_relative 'factory_infant'

RSpec.describe(FactoryInfant) do

  before do
    FactoryInfant.define do
      factory User do
        first_name "Joe"
        last_name {"Of #{ENV['PWD'].split("/").last}"}
        email do
          "person#{Random.rand(300)}@example.com"
        end
      end
    end

    @user = FactoryInfant.build(User)
    @other_user = FactoryInfant.build(User, first_name: "Frank")
  end
  it "Initialises a new fixture-object" do
    expect(FactoryInfant.registry[User]).to be_a Factory
  end

  it "Creates a factory with the parameters provided" do
    expect(@user.first_name).to eq "Joe"
    expect(@user.last_name).to eq "Of factory-infant" #changes depending on Present Working Directory
    expect(@user.email).to match /person\d+{1,3}@example.com/
  end

  it "Creates users with overridable properties" do
    expect(@other_user.first_name).to eq "Frank"
  end
end

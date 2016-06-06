class User
  attr_accessor :first_name, :last_name, :email

  def full_name
    puts first_name + last_name
  end
end

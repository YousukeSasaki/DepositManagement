module ApplicationHelper

  def full_address(data)
    address = data.prefecture.name + data.city + data.address + data.building
    return address
  end

end

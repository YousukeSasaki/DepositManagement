module ApplicationHelper

  def full_address(data)
    address = data.prefecture.name + data.city + data.address + data.building
    return address
  end

  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end

end

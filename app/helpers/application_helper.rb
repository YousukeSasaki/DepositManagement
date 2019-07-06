module ApplicationHelper

  def full_address(data)
    data.prefecture.present? ? prefecture = data.prefecture.name : prefecture = ""
    data.city.present? ? city = data.city : city = ""
    data.address.present? ? address = data.address : address = ""
    data.building.present? ? building = data.building : building = ""
    address = prefecture + city + address + building
    return address
  end

  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end

end

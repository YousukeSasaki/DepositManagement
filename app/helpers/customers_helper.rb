module CustomersHelper

  def sex_change(num)
    num == 0 ? sex = "男" : sex = "女"
    return sex
  end

  def full_address(cus)
    address = cus.prefecture.name + cus.city + cus.address + cus.building
    return address
  end

  def time_change(time)
    str = time.to_s
    correct_time = str.gsub(/\+0900/, '')
    return correct_time
  end
end

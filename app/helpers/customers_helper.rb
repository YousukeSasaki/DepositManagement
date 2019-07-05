module CustomersHelper

  def sex_change(num)
    num == 0 ? sex = "男" : sex = "女"
    return sex
  end

  def time_change(time)
    str = time.to_s
    correct_time = str.gsub(/\+0900/, '')
    return correct_time
  end

  def time_jp(time)
    time_jp = time.strftime('%Y年%m月%d日')
    return time_jp
  end

  def datetime_jp(datetime)
    datetime = datetime.strftime('%Y年%m月%d日 %H:%M')
    return datetime
  end
end

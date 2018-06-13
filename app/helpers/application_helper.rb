module ApplicationHelper


def display_hash v
if v > 60
  v.to_i
else
v
end

end

  def temp_class(temp)
    return "blue" if temp <= 42
    return "red" if temp >= 73

    # blue to green
    if temp <= 67
      return "green"
    end

    return "orange"







  end
end

class Deploy

  def some_method(what)
    # no-op
  end

  def callback(what)
    some_method(what)

    "some return value"
  end
end

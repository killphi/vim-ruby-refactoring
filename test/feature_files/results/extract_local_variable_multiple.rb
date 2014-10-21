class Foo
  def bar
    local_variable = "some magic number"

    x = local_variable
    y = local_variable
    z = local_variable + local_variable
    local_variable
  end
end

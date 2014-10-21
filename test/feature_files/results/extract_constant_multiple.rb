class Foo
  MAGIC_STRING = "some magic number"

  def bar
    x = MAGIC_STRING
    y = MAGIC_STRING
    z = MAGIC_STRING + MAGIC_STRING
    MAGIC_STRING
  end
end

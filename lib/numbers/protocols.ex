# Contains all protocols that Numbers dispatches to
# for its different functionality.

defmodule Numbers.Protocols do
  @moduledoc """
  A set of protocols for the different numeric capabilities your data structure might provide.

  In older versions of `Numbers`, structures were required to follow a single, very strict, behaviour.
  But because there are many different kind of structures that benefit from a numeric interface, including
  those for which one or multiple of these operations cannot be (unambiguously) defined,
  this has been split in these different protocols.

  By using the different protocols, each data structure can 'pick and choose' what functionality
  is supported. As protocol dispatching is used, the result should be a lot faster than in older
  versions of Numbers, which performed behaviour-based runtime dispatch on the struct name.
  """
end

defprotocol Numbers.Protocols.Addition do
  @doc """
  Adds two numbers together.
  """
  @spec add(t, t) :: t
  def add(a, b)
end

defprotocol Numbers.Protocols.Subtraction do
  @doc """
  Subtracts the rhs number from the lhs number.
  """
  @spec sub(t, t) :: t
  def sub(a, b)
end

defprotocol Numbers.Protocols.Minus do
  @doc """
  Unary minus. Should return the negation of the number.
  """
  @spec minus(t) :: t
  def minus(num)
end

defprotocol Numbers.Protocols.Absolute do
  @doc """
  The absolute value of a number.
  """
  @spec abs(t) :: t
  def abs(num)
end

defprotocol Numbers.Protocols.Multiplication do
  @doc """
  Multiplies the two numbers together.
  """
  @spec mult(t, t) :: t
  def mult(a, b)
end

defprotocol Numbers.Protocols.Division do
  @doc """
  Divides the rhs by the lhs.

  To be clear, this division operation is supposed to be precise.
  """
  @spec div(t, t) :: t
  def div(a, b)
end

defprotocol Numbers.Protocols.Exponentiation do
  @doc """
  Power function, x^n.

  Unless a dedicated fast power algorithm exists for your data structure,
  you could use the 'Exponentiation by Squaring' algorithm, by calling
  `Numbers.Helper.exp_by_sq(num, integer_power)` in the implementation,
  which is a reasonably fast algorithm that uses `log(n)` multiplication steps.
  """
  @spec pow(t, non_neg_integer) :: t
  def pow(num, integer_power)
end

defprotocol Numbers.Protocols.ToFloat do
  @doc """
  Convert the custom Numeric struct
  to the built-in float datatype.

  It is okay to lose precision during this conversion.
  """
  @spec to_float(t) :: {:ok, t_as_float :: float} | :error
  def to_float(num)
end

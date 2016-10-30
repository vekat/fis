local u = require 'util'

function gaussmf(x, params)
  if x == 'name' then return 'gaussian' end

  local sig, c = table.unpack(params, 1, 2)

  return math.exp(-((x - c)^2) / 2 * sig^2)
end

function trapmf(x, params)
  if x == 'name' then return 'trapezoidal' end

  local a, b, c, d = table.unpack(params, 1, 4)

  return u.max(0, u.min( (x - a)/(b - a), 1, (d - x)/(d - c) ))
end

function trimf(x, params)
  if x == 'name' then return 'triangular' end

  local a, b, c = table.unpack(params, 1, 3)

  return u.max(0, u.min( (x - a)/(b - a), (c - x)/(c - b) ))
end

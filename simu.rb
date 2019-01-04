require 'dxruby'

t = 0
k = 0.96
To = 100
Te = 28
Window.loop do
  break if Input.key_push?(K_ESCAPE)
  temp = (To - Te) * k**t + Te
  p temp
  t += 1
end
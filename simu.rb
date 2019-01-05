require 'dxruby'

t = 0
k = 0.96
To = 100
Te = 28
imgd = (To - Te) / 2

teas = [Image.load('image/tea1.png'),
        Image.load('image/tea2.png'),
        Image.load('image/tea3.png')]

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  temp = (To - Te) * k**t + Te
  p temp
  t += 1
  
  img = (temp / imgd).floor
  Window.draw_scale(-200, 30, teas[img], 0.2, 0.2)
end

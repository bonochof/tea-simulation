require 'dxruby'

t = 0
k = [0.96] * 5
To = [100, 90, 80, 70, 60]
Te = [28] * 5

imgd = []
5.times do |i|
  imgd << (To[i] - Te[i]) / 3
end

p imgd

teas = [Image.load('image/tea1.png'),
        Image.load('image/tea2.png'),
        Image.load('image/tea3.png')]
pos = [-260, -140, -20, 100, 220]

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  
  5.times do |i|
    temp = (To[i] - Te[i]) * k[i]**t + Te[i]
    img = ((temp - Te[i]) / imgd[i]).floor % 3
    p temp, img if i == 0
    Window.draw_scale(pos[i], 30, teas[img], 0.2, 0.2)
  end
  
  t += 1
end

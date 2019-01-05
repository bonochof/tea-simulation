require 'dxruby'

t = 0
k = [0.96] * 5
To = [100, 90, 80, 70, 30]
Te = [28] * 5

img = [Image.load('image/tea3.png'),
       Image.load('image/tea2.png'),
       Image.load('image/tea1.png')]
pos = [-260, -140, -20, 100, 220]

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  
  5.times do |i|
    temp = (To[i] - Te[i]) * k[i]**t + Te[i]
    if    temp > 80 then id = 0
    elsif temp > 40 then id = 1
    else                 id = 2
    end
    Window.draw_scale(pos[i], 30, img[id], 0.2, 0.2)
  end
  
  t += 1
end

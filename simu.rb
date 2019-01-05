require 'dxruby'

t = 0
k = []
To = []
Te = []
5.times do |i|
  k << 0.96 #rand(0.5..1.0)
  To << rand(40..100)
  Te << 20 #rand(10..30)
end

img = [Image.load('image/tea3.png'),
       Image.load('image/tea2.png'),
       Image.load('image/tea1.png')]
pos = [-260, -140, -20, 100, 220]
font = Font.new(32)

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  t = 0 if Input.key_push?(K_RETURN)
  
  5.times do |i|
    temp = (To[i] - Te[i]) * k[i]**t + Te[i]
    if    temp > 80 then id = 0
    elsif temp > 40 then id = 1
    else                 id = 2
    end
    Window.draw_scale(pos[i], 30, img[id], 0.2, 0.2)
    Window.draw_font(10 + i * 130, 30, "Tea#{i}", font)
    Window.draw_font(10 + i * 130, 100, "To: #{To[i]}", font)
    Window.draw_font(10 + i * 130, 140, "Te: #{Te[i]}", font)
    Window.draw_font(10 + i * 130, 180, "k: #{k[i].round(2)}", font)
    Window.draw_font(10 + i * 130, 220, "#{temp.round(1)}['C]", font)
  end
  
  t += 1
end

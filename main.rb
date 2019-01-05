require 'dxopal'
include DXOpal

def init
  $s = 0
  $k = []
  $to = []
  $te = []
  $t = [0] * 5
  5.times do
    $k << 0.96 #rand(0.5..1.0)
    $to << rand(40..100)
    $te << 20 #rand(10..30)
  end
end

Image.register(:tea1, 'image/tea1.png')
Image.register(:tea2, 'image/tea2.png')
Image.register(:tea3, 'image/tea3.png')
img = [:tea1, :tea2, :tea3]
pos = [-260, -140, -20, 100, 220]
font = Font.new(16)
init

Window.load_resources do
  Window.bgcolor = C_BLACK

  Window.loop do
    init if Input.key_push?(K_SPACE)
    $s = 0 if Input.key_push?(K_RETURN)

    m = $s / 60
    5.times do |i|
      temp = ($to[i] - $te[i]) * $k[i]**m + $te[i]
      $t[i] = m if $t[i] == 0 and temp < 40
      id = temp / 40
      Window.draw_scale(pos[i], 30, Image[img[id]], 0.2, 0.2)
      Window.draw_font(10 + i * 130, 30, "Tea#{i}", font)
      Window.draw_font(10 + i * 130, 100, "To: #{$to[i]}[`C]", font)
      Window.draw_font(10 + i * 130, 140, "Te: #{$te[i]}[`C]", font)
      Window.draw_font(10 + i * 130, 180, "k: #{$k[i].round(2)}", font)
      Window.draw_font(10 + i * 130, 220, "#{temp.round(1)}[`C]", font)
      Window.draw_font(10 + i * 130, 260, "t: #{$t[i].round}[m]", font) if $t[i] != 0
    end

    Window.draw_font(460, 440, "#{m.round}[m]".rjust(8), font)
    Window.draw_font(540, 440, "#{$s%60}[s]".rjust(5), font)
    $s += 1
  end
end

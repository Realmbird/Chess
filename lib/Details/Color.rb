module ColorableString
  RGB_COLOR_MAP = {
    cyan: '139;233;253',
    green: '80;250;123',
    red: '255;85;85',
    black: '0;0;0',
    white: '255;255;255'
  }.freeze
  refine String do
    def bg_color(color_name)
      rgb_val = RGB_COLOR_MAP[color_name]
      "\e[48;2;#{rgb_val}m#{self}\e[0m".rjust(2)
    end
  end
end
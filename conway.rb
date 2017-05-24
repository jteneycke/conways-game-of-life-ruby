require "pry"

seed = [
  [0,0,1,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0],
  [0,1,1,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0]
]

# [2,2]

def tick(seed)
  seed.each_with_index.map do |row, row_index|
    row.each_with_index.map do |column, column_index|

      living = if seed[row_index][column_index] == 1
                 true
               else
                 false
               end

      top_center  = seed[row_index - 1][column_index] rescue nil
      left        = seed[row_index    ][column_index - 1] rescue nil
      bottom_left = seed[row_index + 1][column_index - 1] rescue nil
      top_left    = seed[row_index - 1][column_index - 1] rescue nil

      right         = seed[row_index    ][column_index + 1] rescue nil
      bottom_center = seed[row_index + 1][column_index] rescue nil
      bottom_right  = seed[row_index + 1][column_index + 1] rescue nil
      top_right     = seed[row_index - 1][column_index + 1] rescue nil

      count = [
        top_center,
        left,
        bottom_left,
        top_left,
        right,
        bottom_center,
        bottom_right,
        top_right
      ].compact.reduce(:+)

      #live && count < 2       -> dead under_pop
      #live && count > 3       -> dead over_pop
      #2 > count < 3

      #live && count == 2 || 3 -> live
      #dead && count == 3      -> live
      #else -> dead

      if living && [2,3].include?(count)
        1 # live
      elsif !living && count == 3
        1
      else
        0 # He's dead Jim!
      end

    end
  end
end

binding.pry
puts "yolo"


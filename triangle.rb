$map = {
  'BB'=> 'B',
  'RR'=> 'R',
  'GG'=> 'G',
  'BG'=> 'R',
  'BR'=> 'G',
  'GB'=> 'R',
  'GR'=> 'B',
  'RB'=> 'G',
  'RG'=> 'B'
}

COLORED = { BB: 'B', BG: 'R', BR: 'G', GB: 'R', GG: 'G', GR: 'B', RB: 'G', RG: 'B', RR: 'R' }

################
H = 'RGB'
H = Hash[(0..8).map{|x| [x/3, x%3]}.map{|x, y| [H[x] + H[y], H[(y-x+y) % 3]]}]

def triangle r
  if r.length > 1
    n = r.length - 3 ** Math.log(r.length - 1, 3).floor
    return H[triangle(r[0, n]) + triangle(r[-n, n])]
  end
  return r
end

###############################
COLORS = {
 'RR' => 'R', 'GG' => 'G', 'BB' => 'B',
 'RG' => 'B', 'GR' => 'B', 'GB' => 'R',
 'BG' => 'R', 'RB' => 'G', 'BR' => 'G'
}
#########################
def triangle(row)
  array = row.chars

  until array.size == 1
    s = 3 ** Math.log(array.size - 1, 3).to_i
    array = 0.upto(array.size - 1 - s).map { |i| COLORS[array[i] + array[i + s]] }
  end
  
  array.first
end
#########################

COLORS = {
  'RR' => 'R', 'GG' => 'G', 'BB' => 'B',
  'GB' => 'R', 'BR' => 'G', 'RG' => 'B',
  'BG' => 'R', 'RB' => 'G', 'GR' => 'B'
}

def triangle(row)
  [59049, 19683, 6561, 2187, 729, 243, 81, 27, 9, 3, 1].each do |lc|
    while row.size >= lc + 1 do
      row = Array.new(row.size - lc) { |i| COLORS[row[i] + row[i + lc]] }
    end
  end

  row[0]
end
#######################
def triangle(row)
  c = { "BG" => "R", "GB" => "R", "GR" => "B", "RG" => "B", "BR" => "G", "RB" => "G", "BB" => "B", "RR" => "R", "GG" => "G" }
  loop do
    if row.size == 1
      return row
    else
      n = 3 ** Math.log(row.size - 1, 3).to_i + 1
      row = (row.size - n + 1).times.reduce('') { |s, i| s + c[row[i] + row[i + n - 1]] }
    end
  end
end
######################
D={'GB'=>'R','BG'=>'R','RB'=>'G','RG'=>'B','GR'=>'B','BR'=>'G','GG'=>'G','RR'=>'R','BB'=>'B'}
def triangle(r)
  l=r.size
  if l==1 then return r[0]
  elsif l==2 then return D[r]
  end
  x=l-3**Math.log(l-1,3).floor
  return D[triangle(r[0..x-1])+triangle(r[l-x..l])][0]
end


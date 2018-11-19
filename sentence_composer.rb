# -*- coding: utf-8 -*-

require 'mysql'

client = Mysql.connect(ENV['NCCB_MYSQL_HOST'], ENV['NCCB_MYSQL_USER'], ENV['NCCB_MYSQL_PASSWORD'], ENV['NCCB_MYSQL_DB'])
client.charset = "utf8"
client.query("SET time_zone = '+9:00';")

select_one = client.prepare("SELECT third_part_id, third_surface FROM 3gram_for_sentence WHERE first_part_id = ? AND first_surface = ? AND second_part_id = ? AND second_surface = ? ORDER BY RAND() LIMIT 1")

pp_part_id = -1
pp_surf = ""
p_part_id = -1
p_surf = ""

sentence = ""

while true
  # select one token
  select_one.execute(pp_part_id, pp_surf,
                      p_part_id,  p_surf)

  break if(select_one.size == 0) # empty

  # fetch token
  token = select_one.fetch_hash
  part_id = token["third_part_id"].to_i
  surf = token["third_surface"]

  break if part_id < 0
  break if surf == ""

  sentence.concat(surf)

  # shift
  pp_part_id = p_part_id
  pp_surf = p_surf
  p_part_id = part_id
  p_surf = surf

end

puts sentence

select_one.close
client.close

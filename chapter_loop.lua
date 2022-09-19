function loop(name ,value)
	chapter_num=mp.get_property("chapter")
	mp.osd_message(chapter_num, 1)
	
	duration=mp.get_property("duration")
	mp.osd_message(duration, 1)
	
	total=mp.get_property("chapters")
	total_int=tostring(total)
	
		
	chap_str="chapter-list/" .. chapter_num .. "/time"
	
	chapter_start=mp.get_property(chap_str)
	mp.osd_message(chapter_start, 1)
	
	chapter_num_int=tonumber(chapter_num)
	chapter_num_end_int=chapter_num_int + 1
	chap_end_num=tostring(chapter_num_end_int)
	mp.set_property_number("ab-loop-a", chapter_start);
	
	
	
	if chap_end_num == total_int then
		mp.set_property_number("ab-loop-b", duration);
	else
		chap_end_str="chapter-list/" .. chap_end_num .. "/time"
		
		chapter_end=mp.get_property(chap_end_str)
		mp.osd_message(chapter_end, 1)
		
		mp.set_property_number("ab-loop-b", chapter_end);
	end
	
	title_str="chapter-list/" .. chapter_num .. "/title"
	title=mp.get_property(title_str)
	message="Looping Chapter: " .. title .. "\nPress 'l' to Clear Loop."
	mp.osd_message(message, 1)
		
end

mp.add_forced_key_binding("x", "float" ,loop)


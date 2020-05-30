define :get_freq do |n|
  reference_pitch = 440.0
  a = 2**(1.0/12.0)
  reference_pitch*(a**n)
end

modus = [0,2,4,5,7,9,11,12].ring

all_notes = []

for i in 0..12
  all_notes.append(get_freq i)
end

print all_notes


live_loop :play do
  
  play hz_to_midi(get_freq modus.tick)
  sleep 0.5
end
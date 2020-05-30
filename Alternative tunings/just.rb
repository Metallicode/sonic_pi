base_frequency = 440.0

Unison = 1.0
Minor_Second = 25.0/24.0
Major_Second = 9.0/8.0
Minor_Third = 6.0/5.0
Major_Third = 5.0/4.0
Fourth = 4.0/3.0
Diminished_Fifth = 45.0/32.0
Fifth = 3.0/2.0
Minor_Sixth = 8.0/5.0
Major_Sixth = 5.0/3.0
Minor_Seventh = 9.0/5.0
Major_Seventh = 15.0/8.0
Octave = 2.0

all_notes_intervales = [Unison,Minor_Second,Major_Second,
                        Minor_Third,Major_Third,
                        Fourth,Diminished_Fifth,Fifth,
                        Minor_Sixth,Major_Sixth,
                        Minor_Seventh,Major_Seventh,
                        Octave]

modus = [0,2,4,5,7,9,11,12].ring
new_scale = []

s2 = []
for i in 0..12
  s2.append(base_frequency * all_notes_intervales[i])
end
print s2

for i in 0..modus.length-1
  new_scale.append(base_frequency * all_notes_intervales[modus[i]])
end

sc = new_scale.ring

live_loop :d do
  
  play hz_to_midi(sc.tick)
  sleep 0.5
  
end







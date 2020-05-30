base_frequency = 440.0

Sa = 1.0

ri_0 = 256.0/243.0
ri_1 = 16.0/15.0

RI_0 = 10.0/9.0
RI_1 = 9.0/8.0

ga_0 = 32.0/27.0
ga_1 = 6.0/5.0

GA_0 = 5.0/4.0
GA_1 = 81.0/64.0

ma_0 = 4.0/3.0
ma_1 = 27.0/20.0

MA_0 = 45.0/32.0
MA_1 = 729.0/512.0

Pa = 3.0/2.0

dha_0 = 128.0/81.0
dha_1 = 8.0/5.0

DHA_0 = 5.0/3.0
DHA_1 = 27.0/16.0

ni_0 = 16.0/9.0
ni_1 = 9.0/5.0

NI_0 = 15.0/8.0
NI_1 = 243.0/128.0

Octave = 2.0

all_notes_intervales = [Sa, ri_0, ri_1, RI_0, RI_1,
                        ga_0, ga_1, GA_0, GA_1,
                        ma_0, ma_1, MA_0, MA_1,
                        Pa, dha_0, dha_1, DHA_0, DHA_1,
                        ni_0, ni_1, NI_0, NI_1, Octave]

modus = [0,4,8,12,13,17,21, 22, 20,16,13,11,7,3].ring
new_scale = []

s2 = []
for i in 0..all_notes_intervales.length-1
  s2.append(base_frequency * all_notes_intervales[i])
end
print s2

for i in 0..modus.length-1
  new_scale.append(base_frequency * all_notes_intervales[modus[i]])
end

sc = new_scale.ring

live_loop :d do
  
  play hz_to_midi(sc.tick)
  sleep 0.4
  
end







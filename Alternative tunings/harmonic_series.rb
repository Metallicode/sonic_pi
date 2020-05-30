base_tone = 440.0
num_of_tones = 24

tones = []

for i in 1..num_of_tones
  
  V = base_tone*i
  
  while (V > (base_tone*2)) do
      
      V/=2
      
    end
    
    tones.append(V)
    
  end
  
  tones = tones.sort.uniq.ring
  
  modus = [0,2,4,5,7,9,11,12].ring
  
  print tones
  
  live_loop :p do
    #n = tones.tick
    
    with_fx :reverb, room:0.8 do
      #play hz_to_midi(n),release:2.0,amp:0.5
      n = tones[modus.tick]
      play hz_to_midi(n),release:2.0,amp:0.5
      print n
    end
    
    sleep 0.6
  end
  
  
  
  
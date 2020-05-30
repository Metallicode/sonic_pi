ratio = 3.0/2.0
base_tone = 440.0
num_of_notes = 11

fifts = []

for i in 0..num_of_notes
  
  V = base_tone*(ratio**i)
  
  while (V > (base_tone*2)) do
      
      V/=2
      
    end
    
    fifts.append(V)
    
  end
  
  fifts = fifts.sort
  
  modus = [0,2,4,5,7,9,11]
  
  
  
  live_loop :p do
    n = fifts[modus.ring.tick]
    play hz_to_midi(n)
    print n
    sleep 0.4
  end
  
  
  
  
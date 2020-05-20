use_bpm 90
use_debug false

a1 = 2.0
beat_factor = 8

bass_note = :e3

groove_counter = 0
cymbel_counter = 0




#music patterns
kik_pattern = [1,0,0,1 ,0,0,0,0 ,0,0,0,1 ,0,0,0,0].ring
sd_pattern =  [0,0,0,0 ,1,0,0,0, 0,0,0,0 ,1,0,0,0].ring
hh_pattern =  [0,0,1,0 ,0,0,1,0 ,0,0,1,0 ,0,0,1,0].ring
kong_pattern =[0,0,1,0 ,0,0,1,0 ,0,0,1,0 ,0,0,1,0].ring
synth_pattern=[1,1,1,0 ,0,0,1,0 ,0,0,1,0 ,1,1,0,1].ring






#shuffle a new groove for the BD || CONGA in a alternating style
define :shuffle_groove do
  kik_pattern = kik_pattern.shuffle
  kong_pattern = kong_pattern.shuffle
  synth_pattern= synth_pattern.shuffle
  
  sleep a1
  groove_counter += 1
  cymbel_counter += 1
end



#call shuffle function from osc server
live_loop :shuffle do
  use_real_time
  a = sync "/osc*/trigger/change"
  play_harmony
  shuffle_groove
  sleep a1
end








#play samples

live_loop :bd do
  sample 'C:\Users\grysd\Music\samples\kix\BD1050.wav' if kik_pattern.tick > 0
  sleep a1/beat_factor
end



live_loop :sd do
  sample 'C:\Users\grysd\Music\samples\drumCollection\sd\606SNAR2.wav', amp:0.6 if sd_pattern.tick > 0
  sleep a1/beat_factor
end



live_loop :hh do
  if cymbel_counter % 8 ==0
    sample 'C:\Users\grysd\Music\samples\drumCollection\cym\606chat.wav', amp:0.3,release:0.2 if hh_pattern.tick > 0
  else
    sample 'C:\Users\grysd\Music\samples\drumCollection\cym\ride_cymbal.wav', amp:0.05,release:0.2 if hh_pattern.tick > 0
  end
  sleep a1/beat_factor
end



live_loop :cong do
  with_fx :reverb do
    if kong_pattern.tick > 0
      sample 'C:\Users\grysd\Music\samples\drumCollection\cong\78 conga hi b.wav', amp:0.2
    else
      sample 'C:\Users\grysd\Music\samples\drumCollection\cong\78 conga lo b.wav', amp:0.0
    end
    sleep a1/beat_factor
  end
end



live_loop :bass do
  use_synth :tb303
  with_fx :reverb, room: choose([0.3,0.9]), mix:0.4 do
    if synth_pattern.tick > 0
      play scale(bass_note, :major)[0]-12, amp:0.05, release:0.15,cutoff: rrand(80,90)
      sleep a1/8
    else
      if one_in(2)
        play scale(bass_note, :major)[7]-12, amp:0.05, release:0.05
      else
        play scale(bass_note, :major)[0]+12, amp:0.05, release:0.05,cutoff: rrand(80,110)
        
      end
      sleep a1/16
    end
  end
end



define :play_harmony do
  use_synth :dark_ambience
  bass_note = choose([:d3,:c3,:g3, :c4])
  play_chord chord(bass_note,:minor), amp: 0.8, release: 5
  sleep a1
end



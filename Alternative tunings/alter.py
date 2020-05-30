import matplotlib.pyplot as plt
import numpy as np

pyth = [440.0, 469.86328125, 495.0,
        528.59619140625, 556.875,
        594.6707153320312, 626.484375,
        660.0, 704.794921875, 742.5,
        792.894287109375, 835.3125, 880.0]

just = [440.0, 458.33333333333337, 495.0,
        528.0, 550.0, 586.6666666666666,
        618.75, 660.0, 704.0, 733.3333333333334,
        792.0, 825.0, 880.0]
 
harmonic = [ 440.0, 467.5, 495.0, 522.5,
             550.0, 577.5, 605.0, 632.5, 660.0,
             715.0, 770.0, 825.0, 880.0]

temp =  [440.0, 466.1637615180899,
         493.8833012561241, 523.2511306011974,
         554.3652619537442, 587.3295358348151,
         622.2539674441618, 659.25511382574,
         698.4564628660078, 739.9888454232689,
         783.9908719634986, 830.6093951598905,
         880.0]

swara_up = [440.0,
            469.3333333333333,
            495.0,
            528.0,
            556.875,
            594.0,
            626.484375,
            660.0,
            704.0,
            742.5,
            792.0,
            835.3125,
            880.0]
 
swara_down = [440.0,
            463.5390946502058,
            488.8888888888889, 
            521.4814814814814,
            550.0,
            586.6666666666666,
            618.75, 
            660.0,
            695.3086419753085,
            733.3333333333334,
            782.2222222222222,
            825.0,
            880.0]

r = ["I","IIb","II","IIIb","III","IV","IV#","V","VIb","VI","VIIb","VII","VIII"]


fig = plt.figure()
fig.suptitle('Tuning algorithm comparison', fontsize=20)

plt.scatter(r, pyth, c= '#ff0000', s=5)
plt.scatter(r, just, c=  '#0000ff', s=5)
plt.scatter(r, temp, c= '#00ff00', s=5)
plt.scatter(r, harmonic, c= '#cc00cc', s=5)

plt.plot(r, pyth, c= '#ff0000')
plt.plot(r, just, c=  '#0000ff')
plt.plot(r, temp, c= '#00ff00')
plt.plot(r, harmonic, c= '#cc00cc')

plt.plot(r, swara_up, c= '#ff9900')
plt.plot(r, swara_down, c= '#ff0066')

plt.xlabel("Interval")
plt.ylabel("Frequency (Hz)")
plt.legend(['Pythagorean', 'Just','Equal Temperament','Harmonic', 'swara(up)', 'swara(down)'], loc=4)
plt.show()

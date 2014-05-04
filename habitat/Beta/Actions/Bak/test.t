We want two regions: Region #1 and Region #2  They are connected to each
other east and west, and not connected to anything north and south  They are
oriented perpendicular to each other, so that east-west is right-left in one
and front-back in the other

Region #1 contains:
-------------------
cls nd class-name      style xpos ypos orient grstat cont'er statevars
--- -- --------------- ----- ---- ---- ------ ------ ------- ---------
 36  1 ground          0       0    0  216    0      0       none
 69  2 sky             0       0   32  240    0      0       none
  1  3 avatar          0      32  144    0    0      0       as is
  1  4 avatar          0      16  144    0    0      0       as is
  6  5 bag             0      48  128    0    0      0       0 (flag) 0 1 (key
 26  6   escape device 0       0    0    0    0      5       3 (charge)
 30  7   flashlight    0       0    1    0    0      5       0 (on)
 64  8   sensor        0       0    2    0    0      5       none
 13  9 box             0      64  132    0    1      0       1 (flag) 2 3 (key
 37 10   gun           0       0    0    0    0      9       none
 42 11   key           0       0    1    0    0      9       2 3 (keynumber)
 72 12   teddy bear    0       0    2    0    0      9       none
 23 13 door            0     128   33  136    0      0       0 (flag) 0 0 (key
 46 14 magic staff     0      80  140    0    0      0       none
 56 15 phone booth     0      96  148  160    0      0       0 (stat) 0 0 (num
 58 16 plant           0     112  156    0    0      0       1 (mass)
 61 17 rock            0     128  128    0    0      0       0 (mass)
 61 18 rock            0     144  132    0    0      0       0 (mass)
 77 19 towel           0      24  140    0    0      0       none

Region #2 contains:
-------------------
cls nd class-name      style xpos ypos orient grstat cont'er statevars
--- -- --------------- ----- ---- ---- ------ ------ ------- ---------
 36  1 ground          0       0    0    0    0      0       none
 80  2 wall            0       0   32  136    0      0       none
129  3 aquarium        0       8  128    0    1      0       0 (state)
  4  4 atm             0      24  136    0    0      0       none
 12  5 bottle          0      40  144    0    1      0       1 (state)
133  6 bush            0      56  152    0    0      0       none
134  7 chair           0      72  160    0    0      0       none
 17  8 compass         0      88  130    0    0      0       none
 19  9 credit card     0     104  138    0    0      0       none
 24 10 dropbox         0     120  146    0    0      0       none
 29 11 flag            0     146  154    0    0      0       0 (state)
 32 12 garbage can     0      16  128  126    1      0       1 (flag) 0 0 (key
 43 13 knick-knack     0      32  136    0    0      0       0 (isMagic)
 44 14 knife           0      48  144    0    0      0       none
 54 15 paper           0      64  152    0    0      0       none
 34 16 road pizza      0      80  160    0    0      0       none
 70 17 stereo          0      96  130    0    0      0       0 (on) 0 (tape)
 71 18 tape            0     112  138    0    0      0       none
156 19 tree            2     128  144  168    0      0       none
 82 20 window          0     144  154    0    0      0       none

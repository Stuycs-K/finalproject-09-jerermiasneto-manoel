# Final Project Proposal

## Group Members:

Manoel J-N
       
# Intentions:

Create a Processing Project that will hide a black & white image inside of a larger image, as well as reveal hidden messages created with the program
 
WILL ALSO WORK WITH 9BIT RGB for (limited) color image imbedding (since i did black and white so fast)
    
# Intended usage:

## encode:
makefile, tags to add a image to encode and the image to encode into, will then save the image with the other image encoded into it

## decode:
makefile, tags to add the image that will be decoded, will then save the decoded image
  
# Technical Details:

Uses processing, bit modifying/shifting
   
Using bit shifting to hide an black/white image in the last 3 bytes of the each of the rgb channels
processing to modify the image and save modified images

Also uses bit shifting to hide a COLOR image inside of another image. worse color resolution (3 bits per color instead of 8). still uses processing to modify and save image.


  
    
# Intended pacing:

setup tag system - 1 day (5/23)
create BW encode and decode - 1 day (5/27)
create color encode - 1 day (5/28)
create color decode - 1 day (5/29)
research stuff - whenever i fit it in 
video record - 1 day (5/31)
edit video - 1 day (6/1)
submit / final checks - 1 day (6/3)


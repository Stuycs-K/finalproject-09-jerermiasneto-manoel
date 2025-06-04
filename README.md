[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/am3xLbu5)
# In Plain Sight - Image Stenography

### MJMJN

Manoel Jeremias-Neto

### Project Description:

Create a Processing Project that will hide a black & white or color image inside of a larger image, as well as reveal hidden messages created with the program.

Video: [Youtube](https://youtu.be/bp6k1qppC8U)

### Instructions:

Download repository, navigate to it in terminal

To run, use:

`make run ARGS="_"`

replace _ with the args using the following flags:

-e (encode)

-d (decode)

-i IMAGETOBEHIDDEN / IMAGETODECODE

-h IMAGETOHIDEIN

-o OUTPUTFILENAME

-m MODE (either BW or CLR)

-v (visualize)

example encode prompt:

`make run ARGS="-e -i SECRET.png -h INPUT.png -o /secretfolder/ENCODED.png -m BW -v"`

### Resources/ References:

Mr. K's Website
processing.org (Documentation)
Wikipidia (Image)
Audacity (Image)


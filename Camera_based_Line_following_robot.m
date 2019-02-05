vid=videoinput('winvideo');             %initializing the web cam(Image acquisition plugin needed)
start(vid)
preview(vid)                            %opening the web came
 
while(1)
  rgb=getsnapshot(vid);               	%capturing the image
  gray=rgb2gray(rgb);                 	%gray scale
  bw=im2bw(gray);                     	%convert to black and white image
  imshow(bw)
  x=bw(120,90,:);                     	%assigning three pixels to variables
  y=bw(120,180,:);
  z=bw(120,270,:);
  if(x==0&y==0&z==0)					%if all the three pixels are black 	
    disp('forward');					%Move forward
  else if(x==0&z==1)					%if right pixel(z) is white and left pixel(x) black 
		disp('left turn');				%Turn left
       else if(x==1&z==0)        		%if right pixel(z) is black and left pixel(x) white  
				disp('right turn');		%Turn right
			else if(x==1&y==0&z==1)		%if right/left pixel(x,z) is white but center pixel(y) black
					disp('forward');	%Move forward
				 else					%all other conditions
					disp('stop');		%Stop/Halt
                 end
            end
       end
  end
end
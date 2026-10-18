import argparse,subprocess,csv
from PIL import Image
p=argparse.ArgumentParser();p.add_argument('video');p.add_argument('output_csv');p.add_argument('--mode',choices=['internal','external'],required=True);p.add_argument('--ffmpeg',default='ffmpeg');a=p.parse_args()
proc=subprocess.Popen([a.ffmpeg,'-v','error','-threads','2','-i',a.video,'-vf','fps=10,scale=320:180','-f','rawvideo','-pix_fmt','rgb24','-'],stdout=subprocess.PIPE)
with open(a.output_csv,'w',newline='') as f:
 w=csv.writer(f);w.writerow(['time','score']);i=0
 while True:
  data=proc.stdout.read(320*180*3)
  if len(data)!=320*180*3:break
  im=Image.frombytes('RGB',(320,180),data)
  if a.mode=='internal':
   im=im.crop((120,60,185,120));score=sum(g>140 and g>1.15*r and g>1.15*b for r,g,b in im.getdata())
  else:score=sum(r>180 and b>70 and r>1.6*g and b>1.15*g for r,g,b in im.getdata())
  w.writerow([i/10,score]);i+=1
if proc.wait()!=0:raise RuntimeError('ffmpeg failed')

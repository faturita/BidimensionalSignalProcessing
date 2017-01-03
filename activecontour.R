library(jpeg)
library(animation)

DIRECTORYANDFILE="C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\PIC00%03d.jpg";

# Punto a seguir....
X=159;
Y=179;
R=8;

COLOR=1;  # R=1, G=2, B=3

Lin<-c();
Lout<-c();
FI<-c();

# Region es un cuadrado.
r=R;x=X;y=Y;
ang<-seq(from=0,to=2*pi,by=0.01); 
for( i in ang)
{
  Lin<-rbind(Lin,cbind(round( x + r*cos(i)),round(y+r*sin(i))));
}

r=R+1;x=X;y=Y;
ang<-seq(from=0,to=2*pi,by=0.01); 
for( i in ang)
{
  Lout<-rbind(Lin,cbind(round( x + r*cos(i)),round(y+r*sin(i))));
}

# Dibuja Lin y Lout sobre la imagen.
redrawI <- function(I ){
  for(i in seq(from=1,to=dim(Lout)[1])) 
  {
    I[Lout[i,1],Lout[i,2],c(1,2,3)]=0.8;
  }
  for(i in seq(from=1,to=dim(Lin)[1])) 
  {
    I[Lin[i,1],Lin[i,2],c(1,2,3)]=1.0;
  }
  I;
}

isInterior <- function(I,Lin,Lout,P ){
  #subset(subset(Lin,Lin[,1]==P[1]),subset(Lin,Lin[,1]==P[1])[,2]==P[2]);
  borders=subset(Lin,subset(Lin,Lin[,1]==P[1])[,2]==P[2]);
  
  ret=FALSE;
  if (( dim(borders)[1]) > 0 )
  {
    minBorderY = min(borders[,2]);
    maxBorderY = max(borders[,2]);
    minBorderX = min(borders[,1]);
    maxBorderX = max(borders[,1]);
    
    if ( minBorderX < P[1] && P[1] < maxBorderX ) 
    {
      if (minBorderY < P[2] && P[2] < maxBorderY)
      {
        ret=TRUE;   
      }
    }
    
  }
  ret
}

calculateN4<-function(I,P) {
  height=dim(I)[1];
  width=dim(I)[2];
  Up=cbind(P[1],P[2]+1);
  Down=cbind(P[1]+1,P[2]);
  Left=cbind(P[1]-1,P[2]);
  Right=cbind(P[1],P[2]-1);
  
  val = rbind(Up,Down,Left,Right);
}

shouldBeInLout<-function(I,FI,Lin,Lout,P) {
  ret=FALSE;
  if ( FI[P[1],P[2]]>0) {
    N4<-calculateN4(I,P);
    for(u in seq(from=1,to=4)) {
      if ( FI[N4[u,1],N4[u,2]]<0 ) {
        ret=TRUE;
      }
    }
  }
  ret;
}

shouldBeInLin<-function(I,FI,Lin,Lout,P) {
  ret=FALSE;
  if ( FI[P[1],P[2]]<0) {
    N4<-calculateN4(I,P);
    for(u in seq(from=1,to=4)) {
      if ( FI[N4[u,1],N4[u,2]]>0 ) {
        ret=TRUE;
      }
    }
  }
  ret;
}


# Calculo de FI inicial
i = 1;

I = readJPEG(sprintf(DIRECTORYANDFILE,i))

FI=matrix(3, dim(I)[1], dim(I)[2]);

PixelIn<-c();
PixelOut<-c();

for(x in seq(from=1,to=dim(I)[1]))
{
  for(y in seq(from=1,to=dim(I)[2]))
  {
    P = cbind(x,y);
    isInLin =subset(Lin,subset(Lin ,Lin [,1]==P[1])[,2]==P[2]);
    isInLout=subset(Lin,subset(Lout,Lout[,1]==P[1])[,2]==P[2]);
    
    if (isInterior(I,Lin,Lout,P)) {
      FI[x,y]=-3;
      PixelIn<-c(PixelIn,I[x,y,COLOR]);
    } else if (dim(isInLin)[1]>0)  {
      FI[x,y]=1;
    } else if (dim(isInLout)[1]>0) {
      FI[x,y]=-1;
    } else {
      PixelOut<-c(PixelOut,I[x,y,COLOR]);
    }
  }
}


# Joya, tengo los parametros estadisticos de la normal (para la region interna y externa)
mediai=mean((PixelIn));
sigmai = sd((PixelIn));

mediao=mean((PixelOut));
sigmao = sd((PixelOut));


# Parametros de los ciclos.
Na = 3;
epsilon = 10;
Ng = 3;
NUMBEROFFRAMES=200;


# Me genera un HTML con la pelicula.
saveHTML({
  
for(l in seq(from=1, to=NUMBEROFFRAMES))
{
  I = readJPEG(sprintf("C:\\Users\\rramele\\Google Drive\\ATI.Image.Processing\\Videos\\movie1\\movie1\\PIC00%03d.jpg",l))
  
  for (i in seq(from=1, to=Na))
  {
    Lout2<-c();
    for (j in seq(from=1, to=dim(Lout)[1]))
    {
      P<-Lout[j,];
      
      Pvi = (1.0/(sqrt(2*pi)*sigmai^2)) * exp(-(I[P[1],P[2],1]-mediai)^2/(2*sigmai^2));
      Pvo = (1.0/(sqrt(2*pi)*sigmao^2)) * exp(-(I[P[1],P[2],1]-mediao)^2/(2*sigmao^2));
      
      Fd=log(Pvi/Pvo);
      
      if (Fd>0)
      {
        Lin<-rbind(Lin,P);
        FI[P[1],P[2]] = -1;
        
        N4<-calculateN4(I,P);
        
        for(jj in seq(from=1,to=dim(N4)[1])) 
        {
          Y=N4[jj,];
          if (FI[Y[1],Y[2]]==3)
          {
            Lout2<-rbind(Lout2,Y);
            FI[Y[1],Y[2]] = 1;
          }
        }
        
      } else {
        Lout2<-rbind(Lout2,P);
      }
    }
    Lout=Lout2;
    
    Lin2<-c();
    for (j in seq(from=1, to=dim(Lin)[1])) {
      P<-Lin[j,];
      if (!shouldBeInLin(I,FI,Lin,Lout,P)) {
        FI[P[1],P[2]] = -3;
      } else {
        Lin2<-rbind(Lin2,P);
      }
    }
    Lin=Lin2;

    Lin2<-c();
    for (j in seq(from=1, to=dim(Lin)[1]))
    {
      P<-Lin[j,];
      
      Pvi = (1.0/(sqrt(2*pi)*sigmai^2)) * exp(-(I[P[1],P[2],1]-mediai)^2/(2*sigmai^2));
      Pvo = (1.0/(sqrt(2*pi)*sigmao^2)) * exp(-(I[P[1],P[2],1]-mediao)^2/(2*sigmao^2));
      
      Fd=log(Pvi/Pvo);
      
      if (Fd<0)
      {
        Lout<-rbind(Lout,P);
        FI[P[1],P[2]] = 1;
        
        N4<-calculateN4(I,P);
        
        for(jj in seq(from=1,to=dim(N4)[1])) 
        {
          Y=N4[jj,];
          if (FI[Y[1],Y[2]]==-3)
          {
            Lin2<-rbind(Lin2,Y);
            FI[Y[1],Y[2]] = -1;
          }
        }
        
      } else {
        Lin2<-rbind(Lin2,P);
      }
    }
    Lin=Lin2;
    
    Lout2<-c();
    for (j in seq(from=1, to=dim(Lout)[1])) {
      P<-Lout[j,];
      if (!shouldBeInLout(I,FI,Lin,Lout,P)) {
        FI[P[1],P[2]] = 3;
      } else {
        Lout2<-rbind(Lout2,P);
      }
    }
    Lout=Lout2;
  
  }
  
  
  plot(1:10, type='n');
  rasterImage( as.raster(redrawI(I)),1,1,10,10);  
}


},
img.name = "pic",
interval = 0.2,
speed = 100,
htmlfile = "test2.html",
title = "Demo",
autobrowse = TRUE,
description = c("This is an animtated curve\n",
                "...you can describe it here")
);


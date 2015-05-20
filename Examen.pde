float [] p1x = new float[0]; // hold the mouse pressed marks
float [] p1y = new float[0];
float [] p1z = new float[0];
float [] p2x = new float[0]; // hold the mouse pressed marks
float [] p2y = new float[0];
float [] p2z = new float[0];


int count=0;
 
int rect_x1; // catch the start dragging point x
int rect_y1; // catch the start dragging point y
int rect_x2; // record  moving mouseX
int rect_y2; // record moving mouseY
int rect_z1; // record mouseX releasing point
int rect_z2; // record mouseY releasing point.

boolean press, release, drag, drawRect;
///

int a =0, b = 0,paso =1;
int bandera=1, ancho=50,largo=50;
// la bandera es para que guarde la pos de la x y y de la pnatalla DX asi la figura no se arrastrara 
//el ancho y el largo e.e ..... pss es de la figura
int R =0, B=0,G=0; //colores
int figura =0; // al inicio no hayfigura XD
 PImage img;

  void setup()
  { //setup previo a la ejecucion }
    stroke(0);
    size(500,600); //define tamaño de pantalla 
    background(255); //define el color de fondo 
    fill(255,100,100); //pincel rojo 
    rect(300,535,30,10); 
    
    fill(100,100,255); //pincel azul 
    rect(300,545,30,10); 
     
    fill(100,255,100); //pincel verde 
    rect(300,555,30,10); 
   
    fill(R,G,B); //muestra de color
    rect(400,520,60,60);  //sera como el visualizacion del color cx
    
     
      img = loadImage("menu.png");
      image(img, -5,487);
}; 



public void  menu ()
{//las cosas aque apareceran en el menu xp

  fill(255,100,100); //pincel rojo 
  rect(300,535,30,10); 
  
  fill(100,100,255); //pincel azul 
  rect(300,545,30,10); 
   
  fill(100,255,100); //pincel verde 
  rect(300,555,30,10); 
 
  fill(R,G,B); //muestra de color
  rect(400,520,60,60);  //sera como el visualizacion del color cx
  
     
      img = loadImage("menu.png");
      image(img, -5,487);
  
}
void draw(){  
      fill (255);   
  stroke (255);
 if ((mousePressed) && (mouseX < 500) && (mouseY < 500)) {  
  
    fill (R,G,B);
    if (bandera == 1) // esto retiene los valores de las coordenadas iniciales del raton
    {
       a =mouseX;
       b = mouseY;
       bandera =0; //<.---- esto hace que no vuelva a entrar mientas se esta presionando el raton
      
    }
    
     if (figura ==1)
     { //CUADRADO 
     //  strokeWeight (50);
    background(255);
        Rect();
          
     }
     if (figura ==2)
     {  ////CIRCULO
   //   noStroke();
   background(255);
      Cir(); 
      
     }
     if (figura ==3)
     {  ////LINEA
       stroke (255); strokeWeight (6);
      line(a,b, (a+ancho),(b+largo)); 
      
      /// liena de borde bajo y relleno arriba
      stroke (R,G,B); strokeWeight (2);
      line(a,b, (a+ancho),(b+largo)); 
       
     }
     
     if (mouseX> a) // auemnta el ancho al arrastrar el raton
         { 
          ancho=ancho+paso;
         } 
         if (mouseY> b) // auemnta el ancho al arrastrar el raton
         { 
           largo=largo+paso;
         } 
         
         if (mouseX< a) // disminuye el ancho al arrastrar el raton
         { 
           ancho=ancho-paso;
         } 
         if (mouseY< b) // disminuye el ancho al arrastrar el raton
         { 
           largo=largo-paso;
         } 
      
      menu();
  } 
  else
  {
    bandera =1; // otra vez uno para que vuelva a entrar a tomar los valores a y b
    ancho = 50; // el valor del cuadrado de ancho y largo original
    largo =50;
    menu ();  // este menu es para que la cosa negra vuelva a salir o no se notara el cambio del color
  }
  
}; 
   
void mousePressed()
{ 
   
  p1x= append(p1x, mouseX);
  p1y= append(p1y, mouseY);
  rect_x1 = mouseX;
  rect_y1 = mouseY;
  mouseDragged(); // Reset vars
  
  
  //pincel rojo 
  if ((mouseX < 350) && (mouseX > 300) && (mouseY < 545)  && (mouseY > 535)) {  
     R=R+5;
     if(R>=255)
     {
       R=R-255;
     }
    
   fill(R,G,B); 
 };  

  //pincel azul 
  if ((mouseX < 360) && (mouseX > 300) && (mouseY < 565)  && (mouseY > 525)) { 
    B=B+5;
     if(B>=255)
     {
       B=B-255;
     }
  
   fill(R,G,B); 
 };  
 //verde

if ((mouseX < 370) && (mouseX > 300) && (mouseY < 585)  && (mouseY > 515)) { 
    G=G+5;
     if(G>=255)
     {
       G=G-255;
     }
  
   fill(R,G,B); 
 };  
 
  //cambio de figura  cuadrado
  if ((mouseX < 160) && (mouseX > 90) && (mouseY < 580)  && (mouseY > 510)) {    
       figura =1; 
   }
   //circulo
   if ((mouseX < 250) && (mouseX > 170) && (mouseY < 580)  && (mouseY > 510)) {    
       figura =2; 
   }
   //linea
   if ((mouseX < 287) && (mouseX > 260) && (mouseY < 580)  && (mouseY > 510)) {    
       figura =3; 
   }
   System.out.println (figura);
   System.out.println (mouseX); // esto es solo para er si camia la fig
   //borrar pantalla 
  if ((mouseX < 89) && (mouseX > 10) && (mouseY < 580)  && (mouseY > 430)) {  
   background(255);      
   menu ();
      
   }; 

} 

void Rect() 
{
 
  float sizex = rect_x2 - rect_x1;
  float sizey = rect_y2 - rect_y1; 
 
 for (int i=0; i<count; i++) 
{
    beginShape();
    
    vertex(p1x[i], p1y[i]);
    vertex(p2x[i], p1y[i]);
    vertex(p2x[i], p2y[i]);
    vertex(p1x[i], p2y[i]);
    
    endShape(CLOSE);
  }
    if (mousePressed && mouseButton == LEFT)
    {
        rect(rect_x1, rect_y1, sizex,sizey);
     } 
 }
void Cir() 
{
 
  float sizex = rect_x2 - rect_x1;
  float sizey = rect_y2 - rect_y1; 

    if (mousePressed && mouseButton == LEFT) 
    {
        ellipse(rect_x1, rect_y1, sizex,sizey);
     } 
 }

void mouseReleased()
{
  p2x= append(p2x, mouseX);
  p2y= append(p2y, mouseY);
    rect_x2 = mouseX;
    rect_y2 = mouseY;
  count++;
}
 
void mouseDragged() 
{
  rect_x2 = mouseX;
  rect_y2 = mouseY;
}

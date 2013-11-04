public class Blink {
 
 private boolean displayOn = true;
 private int startBlinking = 200;
 private int timeOff = 5;
 private int count = 0;
 
 public Blink(int startBlinking) {
   this.startBlinking = startBlinking;
 }
 
 boolean display(int lifeSpam) {
   if(lifeSpam > startBlinking)
     return true;
   if(count == 0)
   {
     displayOn = !displayOn;
     if(displayOn)
     {
       count = max(timeOff, lifeSpam / 10);
     }
     else
     {
       count = timeOff;
     }
   }
   else
   {
     count--;
   }
   return displayOn;   
 }
 
}
   

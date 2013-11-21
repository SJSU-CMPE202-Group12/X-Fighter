public class Blink {

  private boolean displayOn = true;
  private int startBlinking = 100;
  private double conversion;
  private int timeOff = 3;
  private int timeOn = 35;
  private int count = 0;
  private boolean changeSpeed;

  public Blink(int startBlinking, boolean speedOverTime) {
    conversion = this.startBlinking / (double)startBlinking;
    changeSpeed = speedOverTime;
    if (!changeSpeed)
    {
      timeOff = 10;
    }
  }

  //lifeSpam has to be > 0 to be displayed 
  boolean display(int lifeSpam) {
    if (lifeSpam < 0)
    {
      return false;
    }
    lifeSpam *= conversion;
    if (lifeSpam > startBlinking)
      return true;
    if (count == 0)
    {
      displayOn = !displayOn;
      if (displayOn)
      {
        if (changeSpeed)
        {
          count = max(timeOff, lifeSpam / 5);
        }
        else
        {
          count = timeOn;
        }
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


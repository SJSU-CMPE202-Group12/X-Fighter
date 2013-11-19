public class Timer {
  
  private int startTime;
  private int finalTime;
  private int total;
  private String title;
  private int pause = -1;
  
  public Timer(String displayInfo, int milliseconds) {
    title = displayInfo;
    total = milliseconds;
  }
  
  public void start() {
    startTime = millis();
    finalTime = startTime + total;
  }
  
  public boolean isFinished() {
    return millis() >= finalTime;
  }
  
  public void increaseTime(int milliseconds) {
    finalTime += milliseconds;
  }
  
  public int getTimeLeft() {
    return finalTime - millis();
  }
  
  public void setName(String name) {
    title = name;
  }
  
  public String getName() {
    return title;
  }
  
  public void pause() {
    pause = millis();
  }
  
  public void resume() {
    if(pause != -1)
    {
      finalTime += millis() - pause;
      pause = -1;
    }
  }
}

public class Timer {
  
  private int startTime;
  private int finalTime;
  private int total;
  private String title;
  
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
    return finalTime - startTime;
  }
  
}

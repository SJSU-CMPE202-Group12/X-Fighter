public class Score {
  private int score = 0;
  
  public void increaseScore(int delta) {
    score += delta;
  }
  
  public int getScore() {
    return score;
  }
}

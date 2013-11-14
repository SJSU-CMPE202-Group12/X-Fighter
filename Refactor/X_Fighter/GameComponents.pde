public class GameComponents implements Component, Iterable<Component> {
  private ArrayList<Component> components = new ArrayList<Component>();
  
  private Score score;
  
  void addChild(Component c){
    components.add(c);
  }
  
  void removeChild(Component c){
    components.remove(c);
  }
  
  int getLife() {
    // no implementation
    return 1;
  }

  public void setScore(Score s) {
    score = s;
  }
  
  public void display(){
    for (int i = components.size() - 1; i >= 0; i--) {
      Component c = components.get(i);
      if (c.getLife() <= 0)
      {
        if(c instanceof Enemy)
        {
          ((Enemy) c).increaseScore(score);
        }
        removeChild(c);
      }
      else
        c.display();
    }
  }
  
  public Iterator<Component> iterator(){
    return components.iterator();
  }
}

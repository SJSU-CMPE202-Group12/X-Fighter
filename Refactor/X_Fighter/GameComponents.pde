public class GameComponents implements IComponent, Iterable<IComponent> {
  private ArrayList<IComponent> components = new ArrayList<IComponent>();
  
  private Score score;
  
  void addChild(IComponent c){
    components.add(c);
  }
  
  void removeChild(IComponent c){
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
      IComponent c = components.get(i);
      if (c.getLife() <= 0)
      {
        removeChild(c);
      }
      else
        c.display();
    }
  }
  
  public Iterator<IComponent> iterator(){
    return components.iterator();
  }
}

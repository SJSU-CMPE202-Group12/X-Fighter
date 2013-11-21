public interface IComponent {
  public void addChild(IComponent c);
  public void removeChild(IComponent c);
  public int getLife();
  public void display();
}


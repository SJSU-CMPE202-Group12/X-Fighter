public interface IBossSubject {
  
  public void attachBossObserver(IBossObserver observer);
  public void notifyBossObserver();
}

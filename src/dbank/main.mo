import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  /*var currentValue: Float = 300;
  currentValue := 100;
  Debug.print(debug_show(currentValue));

  public func topUp() {
    currentValue += 1;
    Debug.print(debug_show(currentValue));
  };*/

  stable var currentValue: Float = 300;
  currentValue := 300;
  //Debug.print(debug_show(currentValue));

  stable var startTime=Time.now();
  startTime := Time.now();
  //Debug.print(debug_show(startTime));

  let id = 232343455453; //let can't change value
  //Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount:Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print(debug_show("Amout too large, currentValue less than zero."));
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

   public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };



}
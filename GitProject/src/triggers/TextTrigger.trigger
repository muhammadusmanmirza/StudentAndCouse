trigger TextTrigger on Account (before insert) {
    System.debug('This is Test Trigger ');

}
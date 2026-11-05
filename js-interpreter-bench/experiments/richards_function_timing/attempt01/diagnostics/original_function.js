TaskControlBlock.prototype.isHeldOrSuspended = function () {
  return (this.state & STATE_HELD) != 0 || (this.state == STATE_SUSPENDED);
};

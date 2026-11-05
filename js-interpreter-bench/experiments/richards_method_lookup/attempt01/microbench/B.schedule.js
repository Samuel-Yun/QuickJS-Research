Scheduler.prototype.schedule = function mlSchedule() {
  this.currentTcb = this.list;
  var __mlMethod;
  __mlMethod = this.currentTcb.run;
  while (this.currentTcb != null) {
    if (this.currentTcb.isHeldOrSuspended()) {
      this.currentTcb = this.currentTcb.link;
    } else {
      this.currentId = this.currentTcb.id;
      this.currentTcb = __mlMethod.call(this.currentTcb);
    }
  }
};

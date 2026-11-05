Scheduler.prototype.schedule = function mlSchedule() {
  this.currentTcb = this.list;
  var __mlMethod;
  while (this.currentTcb != null) {
    if (this.currentTcb.isHeldOrSuspended()) {
      this.currentTcb = this.currentTcb.link;
    } else {
      this.currentId = this.currentTcb.id;
       __mlMethod = this.currentTcb.run;
      this.currentTcb = __mlMethod.call(this.currentTcb);
    }
  }
};

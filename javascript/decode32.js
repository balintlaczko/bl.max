/*
decode32.js by balint laczko, 2019
(borrowing a lot from spat5.multi-connect.js by rama gottfried, 2012)
*/

autowatch = 1;

function tstr() {
  this.objarray = new Array();
  this.objcount = 0;
  this.decOrder = 0;
}

var t = new tstr();
var p = this.patcher.parentpatcher; //bl.decode32 version

function clean_up(x) {
  x.objcount = 0;
}

function alignsorty(a, b) {
  if (a.ypos1 < b.ypos1) return -1;
  else if (a.ypos1 > b.ypos1) return 1;
  else return 0;
}

function iterpatch(p) {
  var obj = p.firstobject;
  while (obj) {
    if (obj.selected) {
      t.objarray[t.objcount] = { obj: obj, ypos1: obj.rect[1] };
      t.objcount++;
    }
    obj = obj.nextobject;
  }
}

function connect3Dto2D() {
  var from = 0;
  for (i = 0; i < t.decOrder; i++) {
    p.connect(t.objarray[0].obj, from, t.objarray[1].obj, i * 2);
    p.connect(t.objarray[0].obj, from + 1, t.objarray[1].obj, i * 2 + 1);
    from += 1 + (i + 1) * 2;
  }
  p.connect(t.objarray[0].obj, from, t.objarray[1].obj, 2 * t.decOrder);
}

function bang() {
  clean_up(t);
  iterpatch(p);
  if (t.objcount == 2) {
    t.objarray.sort(alignsorty);
    t.decOrder = jsarguments[1];
    connect3Dto2D();
  } else {
    post("Select (only) the encoder~ and the decoder~!\n");
  }
}

function msg_int(a) {
  clean_up(t);
  iterpatch(p);
  if (t.objcount == 2) {
    t.objarray.sort(alignsorty);
    t.decOrder = a;
    connect3Dto2D();
  } else {
    post("Select (only) the encoder~ and the decoder~!\n");
  }
}

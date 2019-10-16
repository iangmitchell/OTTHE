function counter(){
	this.num=0;
	this.timer = setTimeout(function add(){
		this.num++;
		var self=this;
		console.log(this.num);
		console.log(this);
	},1000);
}
var a =new counter();

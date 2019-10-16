function printStr(prev,curr,t){
		return new Promise((resolve,reject)=>{
		setTimeout(
			()=>{	if((typeof(prev)=='string') && (typeof(curr)=='string')){
					resolve(prev+curr)
				} else {
					reject('Enter Strings only')
					}
				},
			t);
		})
}
function printAll(){
	printStr('','A',2500)
	.then( (result)=>printStr(result,'B',250))
	.then( (result)=>printStr(result,'C',25))
	.then( (result)=>console.log(result))
	.catch( result=>console.log(result))
}
async function printAll2(){
	let str=''
	str=await printStr(str,'X',2500)
	str=await printStr(str,'Y',250)
	str=await printStr(str,'Z',25)
	console.log(str);
}
printAll();
setTimeout(()=>{printAll2()},5000)

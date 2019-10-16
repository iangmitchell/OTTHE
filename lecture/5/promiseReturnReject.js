var asyncAdd = (a,b) => {
	return new Promise((resolve,reject) =>{
		setTimeout(()=>{
			if( (typeof a === 'number') && (typeof b === 'number'))	{
				resolve(a+b);
			} else {
				reject('enter two numbers');
			}
		},500);
	});

};

asyncAdd(5,'a').then(
	//first callback is the success - resolve case
	(message)=>{console.log('Sum:',message);},
	//second callback is the failure - reject case
	(errorMessage)=>{console.log('Error:',errorMessage);}
	);

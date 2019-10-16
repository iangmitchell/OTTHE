var somePromise = new Promise((resolve,reject)=>{
	setTimeout(()=>{
		reject('It Failed');
			},500);
	
});

somePromise.then((message) => {
	console.log('success:',message);},
	(errorMessage) => {
	console.log('Failure:',errorMessage);
});

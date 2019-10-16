var somePromise = new Promise((resolve,reject)=>{
	setTimeout(()=>{
			resolve('It worked');
			resolve('It worked again');//won't run - promises can only either be resolved or rejected once
			},500);
	
});

somePromise.then((message) => {
	console.log('success:',message);},
	(errorMessage) => {
	console.log('Failure:',errorMessage);
});

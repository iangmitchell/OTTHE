const ns='org.bmars.net';

/*
 * @param{org.bmars.net.assignKeyWorker} assignKeyWorker-manager assigns a service user a key worker 
 * @transaction
 */
async function assignKeyWorker(tx)
{
    tx.Patient.keyWorker = tx.newKeyWorker;
    let parReg = await getParticipantRegistry(ns+'.SU');
    await parReg.update(tx.Patient);        
}
/*
 * @param{org.bmars.net.RegisterSU} RegisterSU - manager registers SU
 * @transaction
 */
async function RegisterSU(tx)
{
    tx.Patient.Home = tx.Home;
    let parReg = await getParticipantRegistry(ns+'.SU');
    await parReg.update(tx.Patient);
}
/*
 * @param{org.bmars.net.Prescribe} Prescribe - doctors write prescriptions
 * @transaction
 */
async function Prescribe(tx)
{
    tx.Patient.prescription = tx.prescription;
    let parReg = await getParticipantRegistry(ns+'.SU');
    await parReg.update(tx.Patient);
}
/* 
 * @param{org.bmars.net.Administer} Administer - medication administration to service user
 * @transaction
 */
async function Administer(tx)
{
/* 
 A single mar sheet replaces the record in SU. This single mar sheet is created using the concept MAR
 Then that concept/asset replaces the record in the appropriate SU registry.
 The test is to check for double dosage.
 There is a usability issue here, of post-completion error. 
 So, the nurse has to enter the data before she administers the drug, this is to confirm a check for double dosage - no point issuing a warning retrospectively. The nurse then confirms, by another event.

  --> SU Patient
  o TimeOfAdministration time
  --> Medication [] actualMed
  o MedicationAdministrationCode [] MAC
*/
  	var me = getCurrentParticipant();
    return getAssetRegistry(ns+'.SU')
  		.then (function(suReg){
      		return suReg.get(tx.Patient.getIdentifier())
      			.then (function (singleSU){
              	for (var i=0; i<singleSU.prescription.length;i++)
              	{// for each medication
                   currentMed=singleSU.prescription[i];
                   if ((tx.time !== singleSU.MARsheet.time[tx.time])&&(singleSU.prescription.Frequency[tx.time]))
                   {//would require further checks and foolproofing
                    singleSU.Nurse = me;
                    singleSU.MARsheet.time[i] = tx.time;
                    singleSU.MARsheet.actualMed[i] = tx.actualMed[i];
                    singleSU.MARsheet.MAC[i] = tx.MAC[i];
                    
                  }
                  else
                  {
                     throw new Error('already given');

                  }
                }
        		return suReg.update(singleSU);
                
            });
      	
      }); 		
}

/*
 * @param{org.bmars.net.Observe} Observe - witness administration of controlled substances
 * @transaction
 */
async function Observe(tx)
{
    console.log('observed');
    //do nothing to registers, update blockchain
}

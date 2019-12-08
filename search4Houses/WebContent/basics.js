/**
 * 
 */


function goBack(){
	  window.history.back();
}

function checkSearch()
{
   if (isNaN(document.zipSearch.zipcode.value)){
    	alert("Numericals only");
        document.zipSearch.zipcode.focus();
        return false;
    } else if (document.zipSearch.zipcode.value.length <5){
    	alert("Zipcode needs to be 5 digits");
        document.zipSearch.zipcode.focus();
        return false;
    }else if (document.zipSearch.zipcode.value.length > 5){
    	alert("Zipcode needs to be 5 digits");
        document.zipSearch.zipcode.focus();
        return false;
    }
    
    
}




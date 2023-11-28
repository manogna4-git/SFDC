({       
    
    MAX_FILE_SIZE: 4500000, //Max file size 4.5 MB 
    
    
    uploadHelper: function(component, event) {
        var spinner = component.find("mySpinner");
        $A.util.removeClass(spinner, "slds-hide");
        // get the selected files using aura:id [return array of files]
        
        var fileInput = component.find("fuploader").get("v.files");
        console.log("fileInput___________",fileInput);
        // get the first file using array index[0]  
        var file = fileInput[0];
        console.log("file_____________",file);
        var self = this;
        // check the selected file size, if select file size greter then MAX_FILE_SIZE,
        // then show a alert msg to user,hide the loading spinner and return from function  
        if (file.size > self.MAX_FILE_SIZE) {
            component.set("v.fileName", 'Alert : File size cannot exceed ' + self.MAX_FILE_SIZE + ' bytes.\n' + ' Selected file size: ' + file.size);
            return;
        }
        
        // create a FileReader object 
        var objFileReader = new FileReader();
        
        objFileReader.onload = function() {
            var fileContents = objFileReader.result;
            var base64Mark = 'base64,';
            var dataStart = fileContents.indexOf(base64Mark) + base64Mark.length;
            fileContents = fileContents.substring(dataStart);
            self.upload(component, file, fileContents);
        };
        
        objFileReader.readAsDataURL(file);
    },
    
    
    upload: function(component, file, fileContents) {
        var action = component.get("c.sendmail"); 
         console.log("recordId___________", component.get("v.recordId"));
        action.setParams({
            parentId:  component.get("v.recordId"),
            fileName: file.name,
            base64Data: encodeURIComponent(fileContents), 
            contentType: file.type
        });
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state === "SUCCESS"){
                var attachId = response.getReturnValue();
                console.log("attachId______________",attachId);
                if(attachId == 'Applied Sucessfully'){
                    var spinner = component.find("mySpinner");
                    $A.util.addClass(spinner, "slds-hide");
                    
                    if(component.get("v.showmodal")){
                        component.destroy();
                    }else{
                        $A.get('e.force:closeQuickAction').fire();
                    }
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        message: attachId,
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }else{
                    if(component.get("v.showmodal")){
                        component.destroy();
                    }else{
                        $A.get('e.force:closeQuickAction').fire();
                    }
                    alert(attachId);
                     var spinner = component.find("mySpinner");
                    $A.util.addClass(spinner, "slds-hide");
                }
                
                // handel the response errors        
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            } 
        });       
        $A.enqueueAction(action);
    },
    
})
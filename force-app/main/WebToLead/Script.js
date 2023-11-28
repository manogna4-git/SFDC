function beforesubmit() {
    let outputdate = document.querySelector(".output");
    let inputdate = document.querySelector(".input");
    console.log(inputdate.value);
    let formatedDate = new Date(inputdate.value).toLocaleDateString("en-IN");
    outputdate.value = formatedDate;
}
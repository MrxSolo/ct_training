const URL="https://jsonplaceholder.typicode.com/users/"
const id=document.getElementById("box")
const btn=document.getElementById("btn")
const display=document.getElementById("dis")
const error=document.getElementById("error")
display.style.display="none"
error.style.display="none"

btn.addEventListener('click',()=>{
    if (id.value>=1 && id.value <=10){
        display.style.display="block"
        error.style.display="none"
        const reqURL = `${URL}${id.value}`
    fetch(reqURL)
    .then(data=>data.json())
    .then(data=>{
        let name=document.getElementById("1")
        let username=document.getElementById("2")
        let email=document.getElementById("3")
        let phone=document.getElementById("4")
        let website=document.getElementById("5")
        name.textContent=data.name
        username.textContent=data.username
        email.textContent=data.email
        phone.textContent=data.phone
        website.textContent=data.website
        
    })
    }
    else{
        display.style.display="none"
        error.style.display="block"
    }
    
})


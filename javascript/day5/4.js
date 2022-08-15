const URL="https://jsonplaceholder.typicode.com/posts"
const id=document.getElementById("id");
const nam=document.getElementById("name");
const username=document.getElementById("username");
const email=document.getElementById("email");
const button=document.getElementById("button");

button.addEventListener('click',()=>{
    fetch(URL,{
        method: 'POST',
        body: JSON.stringify({
          user_id: `${id.value}`,
          name: `${nam.value}`,
          username: `${username.value}`,
          email: `${email.value}`, 
        }),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      })
      .then(data=>data.json())
      .then(data=>console.log(data))
})

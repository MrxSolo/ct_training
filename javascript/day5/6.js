const URL="https://jsonplaceholder.typicode.com/posts"
const user_id=document.getElementById("user_id");
const nam=document.getElementById("name");
const username=document.getElementById("username");
const email=document.getElementById("email");
const postButton=document.getElementById("postButton");
const putButton=document.getElementById("putButton");
const deleteButton=document.getElementById("deleteButton");

postButton.addEventListener('click',()=>{
    fetch(URL,{
        method: 'POST',
        body: JSON.stringify({
          user_id: `${user_id.value}`,
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

putButton.addEventListener('click',()=>{
    fetch(`${URL}/${user_id.value}`,{
        method: 'PUT',
        body: JSON.stringify({
          user_id: `${user_id.value}`,
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

deleteButton.addEventListener('click',()=>{
    fetch(`${URL}/${user_id.value}`, {
        method: 'DELETE',
      })
})
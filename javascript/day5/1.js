const URL="https://jsonplaceholder.typicode.com/posts"
const xhr=new XMLHttpRequest;
xhr.open("GET",URL);
xhr.onload = ()=>{
    const response = xhr.response;
    const data = JSON.parse(response);
    console.log(data[0].userId)
    let hold = document.getElementById("output");
    let out = ""
    for (let ele of data){
        out+=`
        <tr>
                <td>${ele.userId}</td>
                <td>${ele.id}</td>
                <td>${ele.title}</td>
                <td>${ele.body}</td>
        </tr>  
        `
    }
    hold.innerHTML=out
}

xhr.send()


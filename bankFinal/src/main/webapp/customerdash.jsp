<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>first page</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <style>
 body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.welcome-bar {
    background: linear-gradient(to right, #2196F3, #ffffff);/* to Pink gradient */
    padding: 10px;
    text-align: center;
    color: black;
    font-weight:bold; /* Text color */
}

.main {
    display: flex;
}

.nav {
    background: linear-gradient(to right, #2196F3, #ffffff); /*to Pink gradient */
    border: none;
    width: 250px;
    height: auto;
    overflow-y: auto;
}

.nav-item {
    padding: 20px;
    text-align: center;
}

.page__name {
    margin-top: 10px;
}

.nav2 ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.nav2 a {
    display: block;
    text-decoration: none;
    padding: 15px 20px;
    color: black;
    font-weight: bold; /* Text color */
}

.nav2 a:hover {
    background-color: #ddd;
}

.container1 {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    flex-grow: 1;
    margin: 20px;
}

.container1 h2 {
    text-align: center;
    margin-bottom: 20px;
}

.container1 p {
    margin-bottom: 10px;
}

.container1 p:last-child {
    margin-bottom: 0;
}

.container1 form {
    max-width: 400px;
    margin: 0 auto;
}

.container1 form p {
    font-weight: bold;
}

.container1 form p span {
    font-weight: normal;
}

@media only screen and (max-width: 768px) {
    .main {
        flex-direction: column;
    }

    .nav {
        width: 100%;
        height: auto;
    }

    .container1 {
        margin: 20px 0;
    }
}

img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    align-items: center;
    margin-bottom: 20px;
}

    </style>
</head>
<body>
  <div class="welcome-bar">
      <h3>Welcome, <%= session.getAttribute("full_name") %></h3>
  </div>
  <div class="main">
    <ul class="nav flex-column">
        <li class="nav-item ownblog">
          <img src="login.jpeg" alt="">
          
        </li>
        <div class="nav2">
          <ul>
          <a href="#">
            <div class="home">
          
          <span class="text home-outline">Dashboard</span>
          </a>   
           </div>
           <div class="profile">
          <a href="transaction.jsp"> 
            <span class="text">Transactions</span></a>
          </div>
        
          <div class="photo ">
            <a href="deposite.jsp">
                <span class="text">Deposit</span></a>
             </a>
            </div>
            <div class="photo ">
                <a href="withdraw.jsp">
                    <span class="text">Withdraw</span></a>
                </a>
           </div>
            <div class="photo ">
                <a href="forgot.jsp">
                    <span class="text">Change Password</span></a>
                </a>
           </div>
            <div class="photo ">
                <a href="update1.jsp">
                    <span class="text">Update Details</span></a>
                </a>
           </div>
        <div class="setting">
          <a href="logout.jsp"></span>
          <span class="text">LogOut</span></a></div>
         
          </ul>
          <!-- link for icon "ionicons"-->
          <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
          <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>   
       </ul>

          <!-- part2 -->
          
                <div class="container1">
    <form action="" method="get">
        <h2>Profile</h2>
        <!-- Display customer account details -->
        <p>Account Number: <%= session.getAttribute("account_number") %></p>
        <p>Balance: <%= session.getAttribute("initial_balance") %></p>
        <p>Email: <%= session.getAttribute("email") %></p>
        <p>Mobile_No: <%= session.getAttribute("mobile_no") %></p>
        <p>Date of Birth: <%= session.getAttribute("dob") %></p>
        <p>Address: <%= session.getAttribute("address") %></p>
        <p>Account Type: <%= session.getAttribute("account_type") %></p>
        <p>Id Proof: <%= session.getAttribute("id_proof") %></p>
        
        
        
    </form>
</div>
                
          </div>
          
</body>
</html>

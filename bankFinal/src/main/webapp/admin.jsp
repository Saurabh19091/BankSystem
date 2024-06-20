<!DOCTYPE html>
<html>

<head>
    <title>Homepage</title>
    
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-sizing: border-box;
        }

        /* Additional Styles */
        #container {
            height: 100vh;
            width: 100vw;
            background-color: white; /* White background color */
            border: 4px solid var(--primary-color); /* Primary color border */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #outer-card {
            padding: 0 1vw;
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100vw;
            height: 6vh;
            color: #000;
            background-color: white; /* White background color */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
            position: fixed;
        }

        #title {
            color: #0000FF; /* Primary color text */
            font-weight: 600;
            font-size: 25px;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        #links {
            display: flex;
            gap: 5vh;
        }

        #links>a {
            font-size: 15px;
            text-decoration: none;
            padding: 5px;
            background-color: var(--primary-color); /* Primary color background */
            border-radius: 10px;
        }

        #links>a:hover {
            box-shadow: 0px 0px 0 1px rgb(255, 255, 255);
            border-radius: 5px;
            padding: 5px;
            border: 1px solid ;
            color: #fff;
            background-color:#0000FF ;
        }

        #main {
            height: 98vh;
            display: flex;
            align-items: center;
        }

        img {
            margin-left: -40px;
            width: 600px;
            height: 500px;
            border-radius: 10px;
        }

        #content {
            width: 50vw;
            margin-left: 10vw;
        }

        #inner-card {
            margin-top: 40vh;
            background-color: #ffff;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #e7d4d4;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add box shadow for depth */
        }

        form {
            display: flex;
            width: 400px;
            padding:20px;
            flex-direction: column;
            justify-content: center;
            background-color: #e7e7e7;
        }

        form h2{
            color: #0000FF;
        }

        #button {
            height: 5vh;
            width: 7vw;
            border-radius: 10px;
            font-size: 19px;
            color: var(--basic);
            font-weight: 700;
            border: 2px solid rgb(112, 111, 113);
            padding-left: 10px;
            padding-right: 10px;
            border: none;
            color: #ffff;
            font-size: 18px;
            font-weight: 400;
            background-color: rgb(5, 86, 5);
            cursor: pointer;
        }

        #button:hover{
            background-color:rgb(48, 109, 48) ;
            cursor: pointer;
        }

        .inputForms {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 10px;
        }

        input[type="text"],
input[type="password"],
input[type="number"],
input[type="email"],
input[type="date"],
textarea,
select {
    width: 100%;
    padding: 5px;
    margin: -15px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"]:focus,
input[type="password"]:focus,
input[type="number"]:focus,
input[type="email"]:focus,
input[type="date"]:focus,
textarea:focus,
select:focus {
    border-color: #007bff;
    outline: none;
}
        /* Additional styles for specific input types */
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            -moz-appearance: textfield;
        }

        #form_ac {
            font-size: 18px;
            font-weight: 600;
            width: 72vh;
            gap: 3vh;
            padding: 1vh 2vh;
            display: flex;
            align-items: center;
            color: white;
            background-color:;
            border-radius: 20px;
            margin: 0 0 3vh 5vh;
        }

        #radio {
            font-size: 17px;
            font-weight: 600;
            display: flex;
            align-items: baseline;
            gap: 1vh;
            margin: 0 5vh 5vh 0;
        }
        #sub{
        padding:5px;
        background-color: #008000;
        cursor:pointer;
        color:#ffff;
        border:none;
        border-radius:5px;
        margin-top:20px;
        }
        #sub:hover{
        background-color:#90EE90;
        border:#ffff;
        color:#ffff;
        }
    </style>
</head>

<body>
    <div id="container">
        <div id="outer-card">
            <div id="title">
                Bank Management
            </div>
            <div id="links" class="mar-right">
                <a href="admin.jsp">New</a>
                <a class="myLink" href="customer.jsp">View</a>
                <a class="myLink" href="customer.jsp">Update</a>
                <a class="myLink" href="customer.jsp">Delete</a>
                <a href="customer.jsp">All Customers</a>
            </div>
            <div id="links">
                <a href="logoutad.jsp">Logout</a>
            </div>
        </div>
        <div id="main">
            <div id="content">
                <img src="admin.png" alt="">
            </div>
            <div id="inner-card">
                <div id="inner-inner-card">
                    <form action="addCus" method="post">
                        <div>
                            <h2 style="text-align: center;margin-bottom: 4vh;">Add New Customer</h2>
                        </div>
                        <label for="fullName">Full Name:</label><br>
                        <input type="text" id="fullName" name="fullName" required><br>

                        <label for="address">Address:</label><br>
                        <textarea id="address" name="address" required></textarea><br>

                        <label for="mobileNo">Mobile No:</label><br>
                        <input type="text" id="mobileNo" name="mobileNo" required><br>

                        <label for="email">Email id:</label><br>
                        <input type="email" id="email" name="email" required><br>

                        <label for="accountType">Type of account:</label><br>
                        <select id="accountType" name="accountType" required>
                            <option value="Saving Account">Saving Account</option>
                            <option value="Current Account">Current Account</option>
                        </select><br>

                        <label for="initialBalance">Initial Balance (min 1000):</label><br>
<input type="number" id="initialBalance" name="initialBalance" min="1000" value="1000" required><br>

                        <label for="dob">Date of Birth:</label><br>
<input type="date" id="dob" name="dob" max="2006-12-31" required><br>


                        <label for="idProof">Id Proof:(Aadhar Number)</label><br>
                        <input type="text" id="idProof" name="idProof" required><br>

                        <input type="submit" id="sub"value="Register">
                    </form>
                </div>
            </div>            
        </div>
    </div>
</body>

</html>

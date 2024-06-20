<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Modal Example</title>
    <style>
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #007bff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            color: white;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- The Modal -->
<div id="errorModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <p id="errorText">Error Message Goes Here</p>
    </div>
</div>

<script>
    // Display the modal
    function displayModal(errorMessage) {
        var modal = document.getElementById("errorModal");
        var errorText = document.getElementById("errorText");

        // Set error message
        errorText.innerText = errorMessage;

        // Display modal
        modal.style.display = "block";
    }

    // Close the modal
    function closeModal() {
        var modal = document.getElementById("errorModal");
        modal.style.display = "none";
    }
</script>

</body>
</html>

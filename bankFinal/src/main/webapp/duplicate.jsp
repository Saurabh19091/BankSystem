<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duplicate User</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for the modal */
        .modal-dialog {
            margin-top: 10vh; /* Adjust vertical position */
        }

        .modal-content {
            background-color: #f8f9fa;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Add shadow effect */
        }

        .modal-header {
            border-bottom: none;
            padding: 20px;
            background-color: #007bff; /* Set header background color */
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            color: #fff; /* Set text color */
        }

        .modal-title {
            font-weight: bold;
            font-size: 1.2rem;
            margin: 0;
        }

        .modal-body {
            padding: 20px;
            color: #333;
        }

        .modal-footer {
            border-top: none;
            padding: 20px;
            background-color: #f8f9fa; /* Set footer background color */
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            text-align: right;
        }

        .modal-footer button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-footer button:hover {
            background-color: #0056b3;
        }

        .close-btn {
            font-size: 1.2rem;
            color: #fff;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close-btn:hover {
            color: #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="modal" tabindex="-1" role="dialog" id="duplicateModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Duplicate User</h5>
                        <span class="close-btn" data-bs-dismiss="modal">&times;</span>
                    </div>
                    <div class="modal-body">
                        <p>${errorMessage}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Link Bootstrap JS and jQuery (required by Bootstrap) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Script to show the modal -->
    <script>
        $(document).ready(function(){
            $('#duplicateModal').modal('show');
        });
    </script>
</body>
</html>

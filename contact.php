<?php
$page_title = "Contact Us";
include('includes/header.php');
?>
    <link rel="stylesheet" href="www/css/index.css">
</head>
<?php include('includes/navbar.php'); ?>
    <h1 class="contact-header">Contact Us</h1>
    <div>
    <?php 
    //Whoops, this would only work if I setup a mailserver. Which I know how to do but don't think would be worth it haha.
    if (false) {
        // Get the form data
        $to = "hhamelin@iu.edu";
        $from = $_POST['email'];
        $full_name = $_POST['name'];
        $subject = "Form submission";
        $subject2 = "Copy of your form submission";
        $message = $full_name . " wrote the following:" . "\n\n" . $_POST['message'];
        $message2 = "Here is a copy of your message " . $full_name . "\n\n" . $_POST['message'];

        $headers = "From:" . $from;
        $headers2 = "From:" . $to;

        if(mail($to, $subject, $message, $headers) && mail($from, $subject2, $message2, $headers2)) {
            echo "Mail Sent. Thank you " . $full_name . ", we will contact you shortly.";
        } else {
            echo "Sorry, there was an error sending your message.";
        }
    }
    ?>
    </div>
    <div class="contact-wrapper">
        <p style="width:300px;">Who we are: We aim to give a home to every animal without one. Whether it be a green alien cat, green alien dog, or some other third thing, we've got it.</p>
        <form action="contact.php" method="POST">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="5" required></textarea><br><br>
            
            <button type="submit" name="submit">Send Message</button>
        </form>
    </div>
</body>
</html>

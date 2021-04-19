<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Roadway Travels</title>
        <style>
        .div{
            border: 5px solid black;
            margin : 30px;
            padding: 15px;
            background:#03fca1;
        }
        .div1{
            border : 4px solid black;
            text-align : center;
            font-size : 200%;
            padding : 0%;
        }
        
        
        
        
        </style>
    </head>
    <body style="background :#3297a8;">
        <?php
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "roadwaytravels";
        
            $connection = new mysqli($servername, $username, $password, $dbname);
            
            if ($connection->connect_error) {
                die("Connection failed: " . $connection->connect_error);
            }
            echo "Successfully connected to Database.<hr><br>";
        ?>

        <div class="div1" style="background:#03fca1;">
        <h4>Roadway travels</h4>
        </div>
        <div class="div">
            <form action="index.php" method="POST">
                <label>Select Date: <br><label>
                <input type="date" name="listdate"> 
                <input type="submit" name="getList" value="Get List">
            </form>
            <br>

        </div>
    <?php
        if(isset($_POST["getList"])) {
        $date = $_POST["listdate"];

        $sqlList = "SELECT * FROM ticket NATURAL JOIN passenger where JOURNEY_DATE='$date'";
        $result = $connection->query($sqlList);
        if($result != false && $result -> num_rows > 0) {
            echo '<table border="2">';
            echo '<tr>
                    <th>Passenger Nmme</th>
                    <th>Source</th>
                    <th>Destination</th>
                </tr>';
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>".$row["NAME"]."</td><td>".$row["SOURCE"]."</td><td>".$row["DESTINATION"]."</td></tr>";
            }
            echo "</table>";
        }
    }
    ?>
        <div class="div">
            <form action="index.php" method="POST">
                <input type="submit" name="BusList" value="Show Bus List">
            </form>
        </div>
        <?php
            if(isset($_POST["BusList"])) {
                $sql = "SELECT * FROM bus";
                $result = $connection->query($sql);
                if($result != false && $result -> num_rows > 0) {
                    echo '<table border="1">';
                    echo '<tr>
                            <th>Bus No</th>
                            <th>Source</th>
                            <th>Destination</th>
                            <th>Couche Type</th>
                            <th>Fair</th>
                        </tr>';
                    while($row = $result->fetch_assoc()) {
                        echo "<tr>
                            <td>".$row["BUS_NO"]."</td>
                            <td>".$row["SOURCE"]."</td>
                            <td>".$row["DESTINATION"]."</td>
                            <td>".$row["COUCHE_TYPE"]."</td>
                            <td>".$row["FAIR"]."</td>
                        </tr>";
                    }
                    echo "</table>";
                }
            }
        ?>

        <div class="div">
                <label>Reserve seat : <br></label>
            <form action="index.php" method="POST">
                <label>Number of seat :</label><br><input type="text" name="no_of_seat"><br>
                <label>Address        : </label><br><input type="text" name="address"><br>
                <label>Contact no     : </label><br><input type="text" name="contact_no"><br>
                <input type="submit" name="reserve" value="Reserve">
            </form>
        </div>
        <?php
            if(isset($_POST["reserve"])) {
                $no_of_seat = $_POST["no_of_seat"];
                $address = $_POST["address"];
                $contact_no = $_POST["contact_no"];
        
                $sql = "INSERT INTO reservation (PNR_NO, NO_OF_SEATS, ADDRESS, CONTACT_NO, STATUS) VALUES('0','$no_of_seat', '$address', '$contact_no', 'R')";
                $result = $connection->query($sql);
                if($result == TRUE)
                    echo "Seat successfully reserved.";
            }
        ?>

        <div class="div">
                <label>Purchase Ticket : <br></label>
            <form action="index.php" method="POST">
                <label>Name             : <br></label><input type="text" name="name"><br>
                <label>Sex              : <br></lable><input type="text" name="sex"><br>
                <label>Age              : <br></lable><input type="text" name="age"><br>
                <label>Source           : <br></lable><input type="text" name="source"><br>
                <label>Destination      : <br></lable><input type="text" name="destination"><br>
                <label>Contact no       : <br></lable><input type="text" name="contact_no"><br>
                <label>Deperture time   : <br></lable><input type="time" name="dept_time"><br>
                <label>Journey Date     : <br></lable><input type="date" name="journey_date"><br>
                <input type="submit" name="purchase" value="Purchase">
            </form>
        </div>
        <?php
            if(isset($_POST["purchase"])) {
                $name           = $_POST["name"];
                $sex            = $_POST["sex"];
                $age            = $_POST["age"];
                $source         = $_POST["source"];
                $destination    = $_POST["destination"];
                $contact_no     = $_POST["contact_no"];
                $dept_time      = $_POST["dept_time"];
                $journey_date   = $_POST["journey_date"];
                $ticket_number  = null;
                
                $sqlBus = "SELECT * FROM bus WHERE SOURCE='$source' AND DESTINATION='$destination'";
                $resultBus = $connection->query($sqlBus);
                if($resultBus == TRUE && $resultBus->num_rows > 0) {
        
                    $sqlTicket = "INSERT INTO ticket VALUES ('0', '$age', '$sex', '$source', '$destination', '$dept_time', '$journey_date')";
                    if($connection->query($sqlTicket) == TRUE)
                        echo "Successfully purchased.<br>";
                    

                    $sql = "SELECT * FROM ticket ORDER BY TICKET_NO DESC LIMIT 1";
                    $result = $connection->query($sql);
                    if($result != false) {
                        while($row = $result->fetch_assoc()) {
                            $ticket_number =  $row["TICKET_NO"];
                        }
                    }
                    

                    $sqlPassenger = "INSERT INTO passenger VALUES ('$ticket_number', '$name', '$age', '$sex', '$contact_no')";
                    if($connection->query($sqlPassenger) == TRUE)
                        echo "Passenger registered successfully.<br>";
        

                    $sqlReservation = "UPDATE reservation SET STATUS = 'P' WHERE CONTACT_NO='$contact_no'";
                    if($connection->query($sqlReservation) == TRUE)
                        echo "Reservation Status updated.<br>";
                } else {
                    echo "Bus not available on this route.<br>";
                }
            }
        ?>

        <div class="div">
                <label>Cancel Ticket : <br></label>
            <form action="index.php" method="POST">
                <label>Ticket no       : <br></label><input type="text" name="ticket_no"><br>
                <label>Contact no      : <br></label><input type="text" name="contact_no"><br>
                <input type="submit" name="cancel" value="Cancel">
            </form>
        </div>
        <?php
            if(isset($_POST["cancel"])) {
                $ticket_no = $_POST["ticket_no"];
                $contact_no = $_POST["contact_no"];
        
                $sqlCancel="INSERT INTO cancellation SELECT * FROM reservation WHERE CONTACT_NO = '$contact_no'";
                if($connection->query($sqlCancel))
                    echo "Cancellation list updated.<br>";
                $sqlReserve = "UPDATE reservation SET STATUS = 'C' WHERE CONTACT_NO = '$contact_no'";
                if($connection->query($sqlReserve))
                    echo "Reservation list updated.<br>";
                $sqlPassenger = "DELETE FROM passenger WHERE CONTACT_NO = '$contact_no'";
                if($connection->query($sqlPassenger))
                    echo "Passenger list updated.<br>";
                $sqlTicket = "DELETE FROM ticket WHERE CONTACT_NO = '$contact_no'";
                if($connection->query($sqlTicket))
                    echo "Ticket list updated.<br>";
        
                $sqlUpdateCancel = "UPDATE cancellation SET STATUS = 'C' WHERE CONTACT_NO='$contact_no'";
                if($connection->query($sqlUpdateCancel))
                    echo "Status updated.<br>";
            }
        ?>
    </body>
</html>
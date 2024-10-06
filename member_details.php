<?php
include 'db_connect.php';

if (isset($_GET['id'])) {
  $qry = $conn->query("SELECT *, concat(lastname, ', ', firstname, ' ', middlename) as name FROM members WHERE id=" . $_GET['id'])->fetch_array();
  foreach ($qry as $k => $v) {
    $$k = $v;
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Member Details</title>

  <style>
    body,
    html {
      margin: 0;
      display: flex;
      justify-content: center;
      padding: 20px;
      align-items: center;
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
    }

    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
      width: 100%;
      max-width: 900px;
      border: 1px solid #ddd;
      padding: 20px;
      background-color: #fff;
      box-shadow: 0px 3px 15px rgba(0, 0, 0, 0.2);
    }

    .header {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .user-details {
      margin-bottom: 20px;
      width: 100%;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    table,
    th,
    td {
      border: 1px solid #ddd;
    }

    th,
    td {
      padding: 12px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
      text-align: center;
    }

    .plan-details {
      margin-top: 20px;
    }

    .badge-success {
      background-color: green;
      color: white;
      padding: 5px;
    }

    .badge-danger {
      background-color: red;
      color: white;
      padding: 5px;
    }

    .badge-secondary {
      background-color: gray;
      color: white;
      padding: 5px;
    }
  </style>
</head>

<body style="min-height: 100%; overflow: scroll">

  <div class="container">
    <!-- User Details Section -->
    <div class="user-details">
      <div class="header">Member Details</div>
      <table>
        <tr>
          <th>Name</th>
          <td><?php echo ucwords($name); ?></td>
        </tr>
        <tr>
          <th>Gender</th>
          <td><?php echo ucwords($gender); ?></td>
        </tr>
        <tr>
          <th>Email</th>
          <td><?php echo $email; ?></td>
        </tr>
        <tr>
          <th>Contact</th>
          <td><?php echo $contact; ?></td>
        </tr>
        <tr>
          <th>Address</th>
          <td><?php echo $address; ?></td>
        </tr>
        <tr>
          <th>QR Code</th>
          <td><img src="https://quickchart.io/qr?text=<?= $_GET['id']?>&size=120"/></td>
        </tr>
      </table>
    </div>

    <!-- Plan Details Section -->
    <div class="plan-details">
      <div class="header">Membership Plan List</div>
      <table class="table">
        <thead>
          <tr>
            <th>Plan</th>
            <th>Package</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $paid = $conn->query("SELECT r.*, pl.plan, pa.package FROM registration_info r INNER JOIN plans pl ON pl.id = r.plan_id INNER JOIN packages pa ON pa.id = r.package_id WHERE r.member_id = $id ");
          while ($row = $paid->fetch_assoc()): ?>
            <tr>
              <td><?php echo $row['plan'] . ' mo/s.'; ?></td>
              <td><?php echo $row['package']; ?></td>
              <td><?php echo date("M d, Y", strtotime($row['start_date'])); ?></td>
              <td><?php echo date("M d, Y", strtotime($row['end_date'])); ?></td>
              <td>
                <?php if ($row['status'] == 1): ?>
                  <?php if (strtotime(date('Y-m-d')) <= strtotime($row['end_date'])): ?>
                    <span class="badge badge-success">Active</span>
                  <?php else: ?>
                    <span class="badge badge-danger">Expired</span>
                  <?php endif; ?>
                <?php else: ?>
                  <span class="badge badge-secondary">Closed</span>
                <?php endif; ?>
              </td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
  </div>

</body>

</html>

<?php include 'db_connect.php' ?>
<?php
if (isset($_GET['rid'])) {
	$qry = $conn->query("SELECT r.*,p.plan,p.amount as pamount,pp.package,pp.amount as ppamount,concat(m.lastname,', ',m.firstname,' ',m.middlename) as name,m.member_id as mid_no from registration_info r inner join members m on m.id = r.member_id inner join plans p on p.id = r.plan_id inner join packages pp on pp.id = r.package_id where r.id=" . $_GET['rid'])->fetch_array();
	foreach ($qry as $k => $v) {
		$$k = $v;
	}
	$trainer = $conn->query("SELECT * FROM trainers where id= $trainer_id");
	$trainer_arr = $trainer->num_rows > 0 ? $trainer->fetch_array() : '';
	'';
	$tf = $trainer_id > 0 ? $trainer_arr['rate'] : 0;
}

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Date</th>
						<th>Amount</th>
						<th>Remarks</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$pcount = 0;
					$paid = $conn->query("SELECT * FROM payments where registration_id = $id ");
					while ($row = $paid->fetch_assoc()):
						$pcount++;
					?>
						<tr>
							<td><?php echo date("M d,Y", strtotime($row['date_created'])) ?></td>
							<td class="text-right"><?php echo number_format($row['amount']) ?></td>
							<td><?php echo $row['remarks'] ?></td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<large><b>New Payment</b></large>
			<form id="manage_payment" method="POST">
				<input type="hidden" name="registration_id" value="<?php echo $id ?>">
				<div class="form-group">
					<p>Plan Membership Fee: <b class="float-right"><?php echo ($pcount <= 0) ? number_format($pamount, 2) . ' (One-time amount only)' : 'Paid Already' ?></b></p>
					<p>Package Amount: <b class="float-right"><?php echo number_format($ppamount, 2) ?></b></p>
					<p>Trainer Fee: <b class="float-right"><?php echo number_format($tf) ?></b></p>
				</div>
				<hr>
				<div class="form-group">
					<p>Amount Payable: <b class="float-right"><?php echo ($pcount <= 0) ? number_format(($ppamount + $tf + $pamount), 2) : number_format(($ppamount + $tf), 2) ?></b></p>
				</div>
				<div class="form-group">
					<label for="" class="control-label"> Amount</label>
					<input type="text" class="form-control" id="amount" name="amount"
						placeholder="<?php echo ($pcount <= 0) ? number_format(($ppamount + $tf + $pamount), 2) : number_format(($ppamount + $tf), 2) ?>"
						value="<?php echo isset($_POST['amount']) ? htmlspecialchars($_POST['amount']) : ''; ?>">
					<?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
						<?php
						$expected_amount = ($pcount <= 0) ? ($ppamount + $tf + $pamount) : ($ppamount + $tf);
						if (isset($_POST['amount'])) {
							$entered_amount = str_replace(',', '', $_POST['amount']); // Remove commas
							if (number_format((float)$expected_amount, 2) != number_format((float)$entered_amount, 2)): ?>
								<span style="color:red;">The amount must match the total value!</span>
						<?php endif;
						}
						?>
					<?php endif; ?>
				</div>

				<div class="form-group">
					<label for="" class="control-label"> Remarks</label>
					<textarea class="form-control" name="remarks"></textarea>
				</div>
				<div class="form-group">
					<button class="btn btn-primary" type="submit">Save Payment</button>
				</div>
			</form>
		</div>

	</div>
</div>
<div class="modal-footer display">
	<div class="row">
		<div class="col-md-12">
			<button class="btn float-right btn-secondary" type="button" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
<style>
	p {
		margin: unset;
	}

	td,
	th {
		padding: 5px
	}

	#uni_modal .modal-footer {
		display: none;
	}

	#uni_modal .modal-footer.display {
		display: block;
	}
</style>
<script>
	$('#manage_payment').submit(function(e) {
		e.preventDefault()
		start_load()
		$.ajax({
			url: 'ajax.php?action=save_payment',
			method: 'POST',
			data: $(this).serialize(),
			success: function(resp) {
				if (resp == 1) {
					alert_toast('Payment Successfully saved', 'success')
					end_load()
					uni_modal('Payments', 'payment.php?rid=<?php echo $id ?>', 'large')
				}
			}
		})
	})
</script>

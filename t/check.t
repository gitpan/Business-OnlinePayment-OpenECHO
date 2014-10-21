BEGIN { $| = 1; print "1..1\n"; }

print "ok 1 # Skipped: no ACH test yet\n"; exit;

use Business::OnlinePayment;

# checks are broken it seems
my $ctx = new Business::OnlinePayment("OpenECHO");
$ctx->content(
    type           => 'CHECK',
    login          => 'testing',
    password       => 'testing',
    action         => 'Normal Authorization',
    amount         => '49.95',
    invoice_number => '100100',
    customer_id    => 'jsk',
    first_name     => 'Tofu',
    last_name      => 'Beast',
    account_number => '12345',
    routing_code   => '123456789',
    bank_name      => 'First National Test Bank',
);
$ctx->test_transaction(1); # test, dont really charge
$ctx->submit();

print $ctx->is_success()."\n";

if($ctx->is_success()) {
    print "ok 1\n";
} else {
    print "not ok 1 (".$ctx->error_message().")\n";
}
